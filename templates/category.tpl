{% extends "base.tpl" %}

{% block title %}{{ m.rsc[id].seo_title | default: m.rsc[id].title }}{% endblock %}

{% block page_class %}page category{% endblock %}

{% block banner %}{% endblock %}

{% block content %}

		<div id="page-content" class="span-14">
			{% block breadcrumb %}
				{% with m.category[id].path as path %}
					{% ifnotequal path|length 1 %}
						<span class="breadcrumb">
							<a href="{{ m.rsc.page_home.page_url }}">{{ m.rsc.page_home.short_title | default: m.rsc.page_home.title}}</a> &raquo;
							{% for cat_id in path %}
								{% ifnotequal m.rsc[cat_id].name "text" %}
									<a href="{{ m.rsc[cat_id].page_url }}">{{ m.rsc[cat_id].short_title | default: m.rsc[cat_id].title }}</a> &raquo;
								{% endifnotequal %}
							{% endfor %}
							<a href="{{ m.rsc[id].page_url }}">{{ m.rsc[id].short_title | default: m.rsc[id].title }}</a> &raquo;
						</span>
					{% endifnotequal %}
				{% endwith %}
			{% endblock %}
			<h1>{{ m.rsc[id].title }}</h1>
			
		{% with m.search.paged[{query cat=id sort='-rsc.publication_start' pagelen=10 page=q.page}] as pages %}
			<br class="clear" />
			{% pager result=pages dispatch='category' id=id %}
			<br class="clear" />
			
			<ul class="item-list">
			{% for p in pages %}
				<li class="list-item">
					<h3><a href="{{ p.page_url }}">{{ p.title }}</a></h3>
					<div class="item-date">{{ p.publication_start|date:"d/m/Y H:i"}}</div>
				{% if p.summary %}
					<p class="summary">{{ p.summary|linebreaksbr }}</p>
				{% endif %}
				</li>
			{% endfor %}
			</ul>
			{% pager result=pages dispatch='category' id=id %}
		{% endwith %}
		
		</div>
		<div id="page-sep" class="span-1">&nbsp;</div>
		<div class="span-4 page-aside community small">
			<h2 id="community">сообщество</h2>
			<span class="rss-url">http://groups.google.com/group/erlang-russian/feed/rss_v2_0_msgs.xml</span>
		</div>
		<div class="span-4 page-aside forum small">
			<h2 id="forum">форум</h2>
			<div>
				<span class="rss-url">http://feeds2.feedburner.com/Erlang-Russian-Forum</span>				
			</div>
		</div>
	<script type="text/javascript">var headerEl = 'h3';</script>
{% endblock %}