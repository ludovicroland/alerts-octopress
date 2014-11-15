# Title: Alerts for Jekyll
#
# Author: Ludovic Roland http://www.rolandl.fr
#
# Description: Provide contextual feedback messages for typical user actions with the handful of available and flexible alert messages. Base on the Bootstrap CSS Component.
#
# Syntax:
#
# {% alert success|info|warning|danger %}
# alert content
# {% endalert %}
#
# Example:
#
# {% alert success %}
# Well done! You successfully read this important alert message. 
# {% endalert %}
#
# Output:
#
# <div class='alert alert-success'><p>Well done! You successfully read this important alert message.</p></div>
# 
# Example 2 (with Markdown):
#
# {% alert warning %}
# **Warning**
#
# Better check yourself, you're not looking too good.
# {% endalert %}
#
# Output:
#
# <div class='alert alert-warning'><p><strong>Warning</strong><br /><br />Better check yourself, you're not looking too good.</p></div>
#
# Note: this plugin supports markdown !

require 'kramdown'

module Jekyll

  class Alerts < Liquid::Block

    def initialize(tag_name, markup, tokens)
      @type = markup.strip
      super
    end

    def render(context)
      output = paragraphize(super)
      output = Kramdown::Document.new(output).to_html
      html_output(output)
    end

    def paragraphize(input)
      "#{input.lstrip.rstrip.gsub(/\n/, '<br/>')}"
    end

    def html_output(content)
      display = "<div class='alert alert-#{@type}'>"
      display += content
      display += "</div>"
      display
    end

  end

end

Liquid::Template.register_tag('alert', Jekyll::Alerts)

