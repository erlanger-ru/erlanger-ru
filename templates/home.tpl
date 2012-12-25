{% extends "base.tpl" %}

{% block title %}Добро пожаловать{% endblock %}

{% block page_class %}home{% endblock %}

{% block content %}
	<div id="intro" class="container">
		<div class="span-18">
			Erlang — язык для создания отказоустойчивых распределенных приложений. Это — один из немногих функциональных языков, которые давно и успешно применяется на практике.
			
			Например — в телекомах (Ericsson AXD-301 switch), банковских системах, системах автоматизации, высоконагруженных веб-приложениях (Facebook Chat).
			
			При этом Erlang — продукт с открытым исходным кодом и распространяется бесплатно.
			 
			<a href="/erlang/">Подробнее</a>
		</div>
		<div class="span-1">
			&nbsp;
		</div>
		<div class="span-5 small last">
			<a href="http://erlanger.ru/feed/news" class="rss-link">RSS новостей</a><br />
			<a href="http://groups.google.com/group/erlang-russian/feed/atom_v1_0_msgs.xml?num=50" class="rss-link">RSS erlang-russian</a><br />
			<a href="http://feeds.feedburner.com/erlang-in-russian-forum" class="rss-link">RSS форума</a><br />
			<a href="http://feeds.feedburner.com/erlang-in-russian-wiki" class="rss-link">RSS вики</a><br />
			<a href="http://feeds.feedburner.com/erlang-in-russian-comments" class="rss-link">RSS комментариев</a><br />
			<a href="http://twitter.com/ruerlang" class="twitter-link">Erlang по-русски @ Twitter</a><br />
		</div>
	</div>
	<div id="frontpage" class="container">
	
		<div id="news" class="span-6">
			<h1><a href="/category/109">новости</a></h1>
				{% with m.search.paged[{query cat='news' sort='-rsc.publication_start' pagelen=10 page=1}] as pages %}
					{% for p in pages %}
						<div class="item">
							<h2><a href="{{ p.page_url }}">{{ p.title }}</a></h2>
							<div class="item-date">{{ p.publication_start|date:"d/m/Y H:i"}}</div>
						{% if p.summary %}
							<p class="summary">{{ p.summary|truncate:300|linebreaksbr }}</p>
						{% endif %}
						</div>
					{% endfor %}
				{% endwith %}
		</div>
		
		<div id="community" class="span-6">
			<h1><a href="/page/672/soobshhestvo">сообщество</a></h1>
			<span class="rss-url">http://groups.google.com/group/erlang-russian/feed/rss_v2_0_msgs.xml?num=50</span>
			
		</div>
		<div class="span-6" id="forum">
			<h1><a href="/forum/">форум</a></h1>
			<span class="rss-url">http://erlanger.ru/forum/rss/</span>
		</div>
		<div class="span-6 last" id="misc">
			<h1>разное</h1>
			<div id="tweet"></div>
		</div>
	</div>


{% endblock %}
