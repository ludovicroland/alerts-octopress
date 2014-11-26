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

    TypeDismissible = /(success|info|warning|danger)\s(dismissible)/i

    Type =  /(success|info|warning|danger)/

    def initialize(tag_name, markup, tokens)
      if markup =~ TypeDismissible
        @type = $1.strip
        @dismissible = true
      elsif markup =~ Type
        @type = $1.strip
        @dismissible = false
      end

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
      display = "<div class=\"alert alert-#{@type}"

      if @dismissible
        display += " alert-dismissible"
      end

      display += "\" role=\"alert\">"

      if @dismissible
        display += "<button class=\"close\" data-dismiss=\"alert\" type=\"button\">"
        display += "<span aria-hidden=\"true\"></span>"
        display += "<span class=\"sr-only\">Close</span>"
        display += "</button>"
      end

      display += content
      display += "</div>"
      display
    end

  end

end

Liquid::Template.register_tag('alert', Jekyll::Alerts)

