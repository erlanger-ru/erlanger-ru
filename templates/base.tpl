<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE html 
     PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
{% with m.config.seo_google.webmaster_verify.value as wmv %}{% if wmv %}
		<meta name="verify-v1" content="{{ wmv }}" />
		<meta name="google-site-verification" content="{{ wmv }}" />
{% endif %}{% endwith %}
		
		<title>{% block title %}{{ m.rsc[id].seo_title | default: m.rsc[id].title }}{% endblock %} &mdash; erlanger.ru</title>

		<link rel="icon" href="/lib/images/favicon.png" type="image/png" />
		<link rel="shortcut icon" href="/favicon.ico" />

	{% all include "_html_head.tpl" %}
    {% block html_head_extra %}{% endblock %}


	{% lib
		"css/blueprint/screen.css"
		"css/global.css"
		"css/highlighter/shCore.css"
		"css/highlighter/shThemeDefault.css"
	 %}

	<link rel="stylesheet" media="print" type="text/css" href="{% url lib star='css/blueprint/print.css' %}" />

	<!--[if IE]>
	{% lib	"css/blueprint/ie.css" %}
	<![endif]-->
	
	</head>
	<body id="page-body">
	<script type="text/javascript">
		var JSKitConfig = {
		       'comments-paginate': '15',
		       'comments-editable': 'yes'/*,
		       'comments-backwards': 'no'	*/	       
		};
	</script> 
	
		<div id="top-menu" class="container">
			<div class="span-5" id="logo"><a href="/" title="erlanger.ru" alt="erlanger.ru"><img src="/lib/images/site/logo.png" title="erlanger.ru" alt="erlanger.ru"></a>
			</div>
			<!--div class="span-2" id="logo-sep">&nbsp;</div-->
			<div class="span-19" id="top-menu-items">
				<a href="/category/109" id="news-menu-item"{% ifequal m.rsc[id].category.name "news" %} class="active"{% endifequal %}{% ifequal m.rsc[id].name "news" %} class="active"{% endifequal %}>новости</a>
				<a href="/page/672/soobshhestvo" id="community-menu-item"{% ifequal m.rsc[id].page_url "/community" %} class="active"{% endifequal %}>сообщество</a>
				<a href="/forum/" id="forum-menu-item">форум</a>
				<a href="/wiki/index.php" id="wiki-menu-item">вики</a>
				<a href="/wiki/index.php/Полезные ссылки" id="wiki-menu-item">полезно</a>
			</div>
		</div>
		<div class="container">
		{% block chapeau %}{% endblock %}
		{% block content_area %}
		    {% block content %}{% endblock %}
		{% endblock %}
		
			<br style="clear: both" />
			<div id="footer" class="container">
				<div class="span-16">
					&copy; 2007—{% now 'Y' %} erlanger.ru <br /><br />
					Все данные на сайте получены из открытых источников.<br />
					Если вы используете материалы с сайта, пожалуйста, укажите это, поставив ссылку на erlanger.ru<br /><br />
					
					<br /><br />
					<img src="http://banners.erlanger.ru/get/small/?l=Powered by Erlang" /> 
					<br />
					<small><a href="http://banners.erlanger.ru/">Erlang banners</a></small>
					<br /><br /><br />
				</div>
	
				<div class="span-8 last small">
				Реализация: <br /> <a href="http://dmitriid.com/">Дмитрий "Мамут" Димандт</a><br /><br />
				Использовано:<br /> <a href="http://zotonic.com/">Zotonic CMS</a>,
				              <a href="http://www.mediawiki.org/">MediaWiki</a>,
				              <a href="http://bbpress.org/">bbPress</a>,
							  <a href="http://www.blueprintcss.org/">Blueprint CSS</a>,
							  <a href="http://jquery.com/">jQuery</a>,
							  <a href="http://juitter.com/">Juitter</a>,
							  <a href="http://code.google.com/apis/ajaxfeeds/">Google Ajax Feeds</a>,
							  <a href="http://www.feedicons.com/">Feed Icons</a>,
							  <a href="http://erenemre.com/264">Pixel Twitter Badges</a>

				</div>		
			</div>
		</div>
		
	{% include "_js_include.tpl" %}

    {% lib 
            "js/apps/zotonic-1.0.js" 
            "js/apps/z.widgetmanager.js" 
            "js/modules/livevalidation-1.3.js" 
            "js/modules/z.inputoverlay.js"
            "js/modules/jquery.loadmask.js"
            "js/z.superfish.js" 
    %}
    
    {% block _js_include_extra %}{% endblock %}

    <script type="text/javascript">
        $(function() { $.widgetManager(); });
    </script>

    {% script %}


		{% with m.config.seo_google.analytics.value as ga %}
		{% if ga %}
			<script type="text/javascript">
		var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
		document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
			</script>
			<script type="text/javascript">
			try {
				var pageTracker = _gat._getTracker("{{ ga }}");
				pageTracker._trackPageview();
			} catch(err) { }</script>
		{% endif %}
		{% endwith %}
	</body>
</html>
