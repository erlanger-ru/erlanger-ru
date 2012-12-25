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