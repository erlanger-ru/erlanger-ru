-module(erlanger_ru_random_rss).
%% gen_server exports
-export([render/3, dependencies/0]).

render(_, _, _) ->
	{A1,A2,A3} = now(),
    random:seed(A1, A2, A3),
	R = random:uniform(3),
	L = case R of
		1 ->
			[
			 <<
	   		  "<div class=\"span-4 page-aside small community\">",
			  "<h2 id=\"community\">сообщество</h2>",
			  "<span class=\"rss-url\">http://groups.google.com/group/erlang-russian/feed/rss_v2_0_msgs.xml</span>",
			  "</div>"
			 >>
			 ];
		_ ->
			[
			 <<
	   		  "<div class=\"span-4 page-aside small misc\">",
			  "<h2 id=\"misc\">twitter</h2>",
			  "<div id=\"tweet\"></div>",
			  "</div>"
			  >>
			 ]
	end,
	{ok, lists:flatten(L)}.

dependencies() -> [].