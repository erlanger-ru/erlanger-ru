{% extends "base.tpl" %}

{% block title %}Ошибка {{ error_code }}{% endblock %}

{% block content %}
		<div class="container">
			<div class="span-24">
				{% block chapeau %}{% endblock %}
			<h1>{{ error_code }} error</h1>
			<h2>Dear website visitor. You stumbled upon one of our error pages</h2>
			<p>
				At first we would like to apologize
				for the fact that you got here. If the title of this page is 404 then you where looking for a page that does not exist
				in this system. It could have been moved or deleted. Please use our search to find anything you like. Or go the the <a href="/" title="home">homepage</a>.
			</p>
			<p>
				If the title of this page says 500, then the system had to handle 
				something it couldn't handle. A mail is now send to the system administrator.
			</p>
			<div class="notification error">
				<h4>{{ error_code }} error</h4>
				{% wire id="error-trigger" action={slide_toggle speed=350 target="error-explain"} %} 
				<pre id="error-explain">{{ error_dump }}</pre>
			</div>
			</div>
		</div>

{% endblock %}

{% block sidebar %}{% endblock %}