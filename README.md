#Alerts for Octopress 2

Contributors: Ludovic Roland ([http://www.rolandl.fr](http://www.rolandl.fr))<br/>
Stable tag: 0.1<br/>
License: GNU GPL v2.0<br/>
License URI: http://www.gnu.org/licenses/gpl-2.0.html

##Description
Provide contextual feedback messages for typical user actions with the handful of available and flexible alert messages. Base on the Bootstrap CSS Component. This plugin supports markdown !

I did not try on Jekyll but it should works too.

##Installation

* Download the plugin and uncompress it
* Copy the content of the 'plugins' directory into the 'plugins' directory of your Octopress blog
* Copy the content of the 'sass/plugins' directory into the 'sass/plugins' directory of your Octopress blog

##Syntax

```md
{% alert success|info|warning|danger %}
alert content
{% endalert %}
```

##Examples

###Example 1

Code:
```md
{% alert success %}
Well done! You successfully read this important alert message. 
{% endalert %}
```

Output:
```html
<div class='alert alert-success'><p>Well done! You successfully read this important alert message.</p></div>
```

###Example 1 (with Markdown):

Code:
```md
{% alert warning %}
**Warning**

Better check yourself, you're not looking too good.
{% endalert %}
```

Output:
```html
<div class='alert alert-warning'><p><strong>Warning</strong><br /><br />Better check yourself, you're not looking too good.</p></div>
```

##Screenshots

![Basis alerts](https://raw.github.com/ludovicroland/alerts-octopress/master/screenshot1.jpg)

##Changelog

###0.1

* First version with basis alerts.
