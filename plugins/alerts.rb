# Title: Alerts for Octopress 2
#
# Version: 1.0
#
# Author: Ludovic Roland http://www.rolandl.fr
#
# Description: Provide contextual feedback messages for typical user actions with the handful of available and flexible alert messages. Based on the Bootstrap CSS Component.
#
# Syntax:
#
# {% alert success|info|warning|danger [dismissible] %}
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
# Example 3 (dismissible alert):
#
# {% alert info dismissible %}
# Well done! You successfully read this important alert message. 
# {% endalert %}
#
# Output:
#
# <div class="alert alert-info alert-dismissible fade in" role="alert"><button class="close" data-dismiss="alert" type="button"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button><p>Les éléments écrits entre crochets sont facultatifs.</p></div>
#
# Note: this plugin supports markdown !

require 'kramdown'

module Jekyll

  class Alerts < Liquid::Block

    TypeDismissible = /(success|info|warning|danger)\s(dismissible)/i

    Type =  /(success|info|warning|danger)/i

    def initialize(tag_name, markup, tokens)
      if markup =~ TypeDismissible
        @type = $1.strip
        @dismissible = true
      elsif markup =~ Type
        @type = $1.strip
        @dismissible = false
      else
        @type = "info"
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
        display += " alert-dismissible fade in"
      end

      display += "\" role=\"alert\">"

      if @dismissible
        display += "<button class=\"close\" data-dismiss=\"alert\" type=\"button\">"
        display += "<span aria-hidden=\"true\">&times;</span>"
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

