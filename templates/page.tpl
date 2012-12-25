{% extends "base.tpl" %}

{% block title %}{{ m.rsc[id].seo_title | default: m.rsc[id].title }}{% endblock %}

{% block page_class %}page{% endblock %}

{% block content %}
        {% ifequal m.rsc[id].category.name "person" %}
        <div id="page-content" class="span-14">
            {% include "_breadcrumb.tpl" %}
            <article>
            <h1>{{ m.rsc[id].title }}</h1>
            
            <br />&nbsp;<br />

            {{ id.body|show_media }}

            {% with m.search[{query cat='article' hasobject=[id, 'author'] pagelen=20}] as articles %}
                {% if articles %}
                    <h2>Автор статей</h2>
                    <ul>
                    {% for a in articles %}
                        <li><a href="{{a.page_url}}">{{ a.title }}</a></li>
                    {% endfor %}
                    </ul>
                {% endif %}
            {% endwith  %}

            {% with m.search[{query cat='article' hasobject=[id, 'translated'] pagelen=20}] as articles %}
                {% if articles %}
                    <h2>Переводы</h2>
                    <ul>
                    {% for a in articles %}
                        <li><a href="{{a.page_url}}">{{ a.title }}</a></li>
                    {% endfor %}
                    </ul>
                {% endif %}
            {% endwith  %}

            {% with m.search[{query cat='news' hasobject=[id, 'author'] pagelen=20}] as articles %}
                {% if articles %}
                    <h2>В новостях</h2>
                    <ul>
                    {% for a in articles %}
                        <li><a href="{{a.page_url}}">{{ a.title }}</a></li>
                    {% endfor %}
                    </ul>
                {% endif %}
            {% endwith  %}


            {% with m.search[{query cat='website' hasobject=[id, 'author'] pagelen=20}] as articles %}
                {% if articles %}
                    <h2>Внешние ссылки</h2>
                    <ul>
                    {% for a in articles %}
                        <li><a href="{{a.page_url}}">{{ a.title }}</a></li>
                    {% endfor %}
                    </ul>
                {% endif %}
            {% endwith  %}

            {% include "_social_buttons.tpl" %}
            {% include "_prev_next.tpl" %}
            {% include "_js_kit.tpl" %}
            </article>
        </div>
		<div id="page-sep" class="span-1">&nbsp;</div>
		<div class="span-8 page-aside">
    		{% if id.o.photo %}
    		    <a href="{{ id.o.photo.page_url }}">{% image id.o.photo.medium.filename width=200 height=200 %}</a>
    		    <br />
    		    <small><a href="{{ id.o.photo.page_url }}">Увеличенная версия</a></small>
    		    <br />&nbsp;<br />
    		    {% if id.o.photo.short_title %}<br /><em>{{ id.o.photo.short_title }}</em><br />{% endif %}
    		{% endif %}
			<p>
				<h3><a href="/category/102">Все авторы</a></h3>
			</p>
		</div>
		<!--div class="span-4 page-aside">
		    
		</div>
		<div class="span-4 page-aside small community">
		</div-->


        {% else %}

		<div id="page-content" class="span-14">
			{% block breadcrumb %}
				{% with m.category[m.rsc[id].category_id].path as path %}
					{% ifnotequal path|length 1 %}
						<span class="breadcrumb">
							<a href="{{ m.rsc.page_home.page_url }}">{{ m.rsc.page_home.short_title | default: m.rsc.page_home.title}}</a> &raquo;
							{% for cat_id in path %}
								{% ifnotequal m.rsc[cat_id].name "text" %}
									<a href="{{ m.rsc[cat_id].page_url }}">{{ m.rsc[cat_id].short_title | default: m.rsc[cat_id].title }}</a> &raquo;
								{% endifnotequal %}
							{% endfor %}
							<a href="{{ m.rsc[m.rsc[id].category_id].page_url }}">{{ m.rsc[m.rsc[id].category_id].short_title | default: m.rsc[m.rsc[id].category_id].title }}</a> &raquo;
						</span>
					{% endifnotequal %}
				{% endwith %}
			{% endblock %}
			<article>
			<h1>{{ m.rsc[id].title }}</h1>
			<div class="item-date">{{ m.rsc[id].publication_start|date:"d/m/Y H:i"}}</div>

			{{ m.rsc[id].body|show_media }}
			{% if id.medium.filename %}
			    {% image id.medium.filename width=800 class="no-float" %}
			    <br />
			    <em>{{ id.short_title|default:id.body }}</em>
			{% if id.s.photo %}
				{% with id.s.photo as p %}
					На фото: <a href="{{p.page_url}}">{{p.title}}</a>
				{% endwith %}
			{% endif %}

			{% endif %}

			<!--div>
				{{ m.rsc[id].page_url }}
			</div-->
			
			{% ifequal m.rsc[id].category.name 'news' %}		
			
			<div class="prevnext container">
				<div class="span-7 prev">
				{% for id in m.search[{previous cat='news' id=id pagelen=1}] %}
					<a href="{{ m.rsc[id].page_url }}" title="{{ m.rsc[id].title }}">&laquo; {{ m.rsc[id].title }}</a>
				{% endfor %}
				&nbsp;</div>
				<div class="span-7 next">&nbsp;
				{% for id in m.search[{next cat='news' id=id pagelen=1}] %}
					<a href="{{ m.rsc[id].page_url }}" title="{{ m.rsc[id].title }}">{{m.rsc[id].title}} &raquo;</a>
				{% endfor %}
				</div>
			</div>
			</article>			
			{% endifequal %}
			
			{% ifequal m.rsc[id].category.name 'article' %}		
			
			<div class="prevnext container">
				<div class="span-7 prev">
				{% for id in m.search[{previous cat='article' id=id pagelen=1}] %}
					<a href="{{ m.rsc[id].page_url }}" title="{{ m.rsc[id].title }}">&laquo; {{ m.rsc[id].title }}</a>
				{% endfor %}
				&nbsp;</div>
				<div class="span-7 next">&nbsp;
				{% for id in m.search[{next cat='article' id=id pagelen=1}] %}
					<a href="{{ m.rsc[id].page_url }}" title="{{ m.rsc[id].title }}">{{m.rsc[id].title}} &raquo;</a>
				{% endfor %}
				</div>
			</div>
			</article>			
			
			{% endifequal %}
			
			{%comment%}
			{% with m.rsc[id].media as media %}
				{% if media[1] %}
					{% media media[1] width=540 %}
				{% else %}
					{% media id width=540 %}
				{% endif %}
			{% endwith %}
			{%endcomment%}
			
			{% ifequal m.rsc[id].category.name "person" %}
				<h3>Автор статей</h3><p>
				{% with m.rsc[id].s.author as authors %}<ul>
					{% for a in authors %}<li>
					<a href="{{a.page_url}}">{{ a.title }}</a></li>
					{% endfor %}</ul>
				{% endwith %}</p>
			{% endifequal %}

			<br />&nbsp;<br />
			
            <!-- Place this tag where you want the +1 button to render -->
            <div id="fb-root"></div><g:plusone size="small"></g:plusone>&nbsp;<fb:like href="{{ m.config.site.url.value }}{{m.rsc[id].page_url}}" send="true" layout="button_count" width="100" show_faces="false" font=""></fb:like>
			<br />&nbsp;<br />
            
			<div class="js-kit-comments" uniq="{{m.rsc[id].page_url}}" permalink="{{ m.config.site.url.value }}{{m.rsc[id].page_url}}" backwards="no"></div>
		</div>
		<div id="page-sep" class="span-1">&nbsp;</div>
		<div class="span-4 page-aside">
			{% ifequal m.rsc[id].category.name 'news' %}		
			<h2 id="{{m.rsc[id].category.name}}">так же</h2>
			{% endifequal %}
			{% ifequal m.rsc[id].category.name 'article' %}		
			<h2 id="{{m.rsc[id].category.name}}">так же</h2>
			{% endifequal %}
			{% comment %}
	        {% include "_keywords.tpl" %}
			{% endcomment %}
	
			{% with m.rsc[id].s.haspart as collections %}
				{% if collections %}
					{% for c_id in collections %}
						<h3><a href="{{ m.rsc[c_id].page_url }}">{{ m.rsc[c_id].title }}</a></h3>
						
						<ul class="item-list">
						{% for p_id in m.rsc[c_id].o.haspart %}
							<li class="list-item">
								{% ifnotequal p_id id %}
									<h3><a href="{{ m.rsc[p_id].page_url }}">{{ m.rsc[p_id].title }}</a></h3>
								{% else %}
									<h3>{{ m.rsc[p_id].title }}</h3>
								{% endifnotequal %}
								{% if m.rsc[p_id].summary %}
									<p class="summary">{{ m.rsc[p_id].summary }}</p>
								{% endif %}
							</li>
						{% endfor %}
						</ul>
					{% endfor %}
				{% else %}
				{% endif %}
			{% endwith %}
			{% if m.rsc[id].o.external_url %}<p>
				<h3>Ссылки</h3>
				{% with m.rsc[id].o.external_url as urls %}<ul>
					{% for a in urls %}<li>
					<a href="{{m.rsc[a].website}}">{{ m.rsc[a].title }}</a></li>
					{% endfor %}</ul>
				{% endwith %}</p>
			{% endif %}
			{% if m.rsc[id].o.author %}<p>
				<h3>Авторы</h3>
				{% with m.rsc[id].o.author as authors %}<ul>
					{% for a in authors %}<li>
					<a href="{{a.page_url}}">{{ a.title }}</a></li>
					{% endfor %}</ul>
				{% endwith %}</p>
			{% endif %}
			{% if m.rsc[id].o.translated %}<p>
				<h3>Перевод</h3>
				{% with m.rsc[id].o.translated as authors %}<ul>
					{% for a in authors %}<li>
					<a href="{{a.page_url}}">{{ a.title }}</a></li>
					{% endfor %}</ul>
				{% endwith %}</p>
			{% endif %}
			{% if m.rsc[id].o.via %}<p>
				<h3>via</h3>
				{% with m.rsc[id].o.via as authors %}<ul>
					{% for a in authors %}<li>
					<a href="{{a.title}}">{{ a.summary }}</a></li>
					{% endfor %}</ul>
				{% endwith %}</p>
			{% endif %}
			{% if m.rsc[id].o.related %}<p>
				<h3>См. также</h3>
				{% with m.rsc[id].o.related as related %}	<ul>
						{% for a in related %}<li>
						<a href="{{a.page_url}}">{{ a.title }}</a></li>
						{% endfor %}</ul>
				{% endwith %}</p>
			{% endif %}
			{% if m.rsc[id].s.related %}<p>
				<h3>Сюда ссылаются</h3>
				{% with m.rsc[id].s.related as related %}	<ul>
						{% for a in related %}<li>
						<a href="{{a.page_url}}">{{ a.title }}</a></li>
						{% endfor %}</ul>
				{% endwith %}</p>
			{% endif %}
			
			{% ifnotequal m.rsc[id].category.name 'news' %}
				<h2 id="news">новости</h2><div class="small news">
				{% with m.search.paged[{latest cat=109 pagelen=10 page=1}] as pages %}
					{% for p in pages %}
							<h3><a href="{{ p.page_url }}">{{ p.title }}</a></h3>
						{% if p.summary %}
							<p class="summary">{{ p.summary|truncate:50 }}</p>
						{% endif %}
					{% endfor %}
				{% endwith %}
				</div>
			{% endifnotequal %}
			
			
			{% include "_documents.tpl" %}
			
			<!--div id="ads">
				<script type="text/javascript"><!--
				google_ad_client = "pub-1100770823047047";
				/* erlanger.ru */
				google_ad_slot = "0988166606";
				google_ad_width = 120;
				google_ad_height = 240;
				//-->
				<!--/script>
				<script type="text/javascript"
				src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
				</script>
			</div-->
		</div>
		{% call erlanger_ru_random_rss %}
        {% endifequal %}

	<script type="text/javascript">
		var headerEl = 'h3';
	</script>
	
	{% block _js_include_extra %}{% endblock %}

    <!-- Place this tag in your head or just before your close body tag -->
    <script type="text/javascript" src="http://apis.google.com/js/plusone.js">
      {lang: 'ru'}
    </script>
    <script src="http://connect.facebook.net/en_US/all.js#appId=102004643225925&amp;xfbml=1"></script>
{% endblock %}