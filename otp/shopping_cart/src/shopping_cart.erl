-module(shopping_cart).

-behaviour(gen_server).

-export([start_link/0,
         put_item/2,
         finish/1,
         cost_so_far/1,
         init/1,
         handle_call/3,
         handle_cast/2
        ]).

start_link() ->
     gen_server:start_link(?MODULE, [], []).

put_item(Pid, Item) ->
    gen_server:call(Pid, {put, Item}).

cost_so_far(Pid) ->
    gen_server:call(Pid, cost).

finish(Pid) ->
    gen_server:call(Pid, terminate).

init([]) -> {ok, []}.

handle_call(terminate, _From, Items) ->
    {stop, normal, ok, Items};
handle_call(cost, _From, Items) ->
    {reply, lists:foldl(fun({_Name, Price}, Sum) -> Price + Sum end, 0, Items), Items};
handle_call({put, Item}, _From, Items) ->
    {reply, [Item|Items], [Item|Items]}.

handle_cast(_, _) ->
    {noreply, ok}.
