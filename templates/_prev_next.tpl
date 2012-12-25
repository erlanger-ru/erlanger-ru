            <div class="prevnext container">
                <div class="span-7 prev">
                {% for id in m.search[{previous cat=id.category.name id=id pagelen=1}] %}
                    <a href="{{ m.rsc[id].page_url }}" title="{{ m.rsc[id].title }}">&laquo; {{ m.rsc[id].title }}</a>
                {% endfor %}
                &nbsp;</div>
                <div class="span-7 next">&nbsp;
                {% for id in m.search[{next cat=id.category.name id=id pagelen=1}] %}
                    <a href="{{ m.rsc[id].page_url }}" title="{{ m.rsc[id].title }}">{{m.rsc[id].title}} &raquo;</a>
                {% endfor %}
                </div>
            </div>
