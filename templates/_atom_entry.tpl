{% with m.rsc[id] as r %}
	{% with r.medium as medium %}
		<entry xmlns="http://www.w3.org/2005/Atom" xmlns:gd="http://schemas.google.com/g/2005" xml:lang="en">
			{% if r.publication_start|date:"Ymd" <= "20120623" %}
				<id>http://127.0.0.1:51000/id/{{ r.id }}</id>
			{% else %}
				<id>{{ m.config.site.url.value|escapexml }}{{ r.page_url|escapexml }}</id>
			{% endif %}
			<updated>{{ r.modified|date:"c" }}</updated>
			<published>{% if upcoming %}{{ r.date_start|date:"c" }}{% else %}{{ r.publication_start|date:"c" }}{% endif %}</published>
			<author>
				{% with r.o.author[1] as author_id %}
				<name><![CDATA[{{ m.rsc[author_id|default:r.creator_id].title|unescape }}]]></name>
				<uri><![CDATA[{{ m.rsc[author_id|default:r.creator_id].uri|unescape }}]]></uri>
				{% endwith %}
			</author>
			
			<link rel="alternate" type="text/html" href="{{ m.config.site.url.value }}{{ r.page_url|escapexml }}"/>
			
			{% if medium.filename %}
				<link rel="enclosure" type="{{ medium.mime }}" href="{{ m.config.site.url.value }}{% url media_attachment star=medium.filename %}" />
			{% endif %}
			
			{% for media_id in r.media %}
				<link rel="enclosure" type="image/jpeg" href="{{ m.config.site.url.value }}{% image_url media_id width=400 height=400 %}" />
			{% endfor %}

			<title>{{ r.title }}</title>
				<summary>{{ r.summary }}</summary>
				<content type="html"><![CDATA[
			{{r.publication_start|date:"Ymd"}}
			{% if r.body %}
				{{ r.body|show_media|unescape }}
			{% else %}
				{{ r.summary }}
			{% endif %}
			{% if m.rsc[id].o.external_url %}<p>
				<h4>Ссылки</h4>
				{% with m.rsc[id].o.external_url as urls %}<ul>
					{% for a in urls %}<li>
					<a href="{{m.rsc[a].website}}">{{ m.rsc[a].title }}</a></li>
					{% endfor %}</ul>
				{% endwith %}</p>
			{% endif %}
			{% if m.rsc[id].o.author %}<p>
				<h4>Авторы</h4>
				{% with m.rsc[id].o.author as authors %}<ul>
					{% for a in authors %}<li>
					<a href="{{ m.config.site.url.value }}{{a.page_url}}">{{ a.title }}</a></li>
					{% endfor %}</ul>
				{% endwith %}</p>
			{% endif %}
			{% if m.rsc[id].o.translated %}<p>
				<h4>Перевод</h4>
				{% with m.rsc[id].o.translated as authors %}<ul>
					{% for a in authors %}<li>
					<a href="{{ m.config.site.url.value }}{{a.page_url}}">{{ a.title }}</a></li>
					{% endfor %}</ul>
				{% endwith %}</p>
			{% endif %}
			{% if m.rsc[id].o.via %}<p>
				<h4>via</h4>
				{% with m.rsc[id].o.via as authors %}<ul>
					{% for a in authors %}<li>
					<a href="{{ m.config.site.url.value }}{{a.page_url}}">{{ a.summary }}</a></li>
					{% endfor %}</ul>
				{% endwith %}</p>
			{% endif %}
			{% if m.rsc[id].o.related %}<p>
				<h4>См. также</h4>
				{% with m.rsc[id].o.related as related %}	<ul>
						{% for a in related %}<li>
						<a href="{{ m.config.site.url.value }}{{a.page_url}}">{{ a.title }}</a></li>
						{% endfor %}</ul>
				{% endwith %}</p>
			{% endif %}
			{% if m.rsc[id].s.related %}<p>
				<h4>Сюда ссылаются</h4>
				{% with m.rsc[id].s.related as related %}	<ul>
						{% for a in related %}<li>
						<a href="{{ m.config.site.url.value }}{{a.page_url}}">{{ a.title }}</a></li>
						{% endfor %}</ul>
				{% endwith %}</p>
			{% endif %}

			    ]]></content>
			{% if medium.filename %}
				<content type="{{ medium.mime }}" src="{{ m.config.site.url.value }}{% url media_attachment star=medium.filename %}" /> 
			{% endif %}
			
			{% if r.is_a.event and r.date_start %}
				{# http://code.google.com/apis/gdata/docs/2.0/elements.html#gdEventKind #}
				<category scheme="http://schemas.google.com/g/2005#kind" term="http://schemas.google.com/g/2005#event" />
				<gd:eventStatus value="http://schemas.google.com/g/2005#event.confirmed" />
				<gd:when startTime="{{ r.date_start|date:"c" }}" endTime="{{ r.date_end|date:"c" }}" />
				{# <gd:where>My Living Room</gd:where> #}
			{% endif %}
				
			<category term="{{ r.category.name }}" scheme="http://zotonic.com/id/category" />
		</entry>
	{% endwith %}
{% endwith %}
