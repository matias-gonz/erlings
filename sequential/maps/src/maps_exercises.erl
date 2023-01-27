-module(maps_exercises).
-export([sum_of_values/1,return_values/1,sort_by_keys/1,min_value/1,merge/2, map/2, to_map/1, records_to_maps/1, maps_to_records/1, proplist_to_map/1]).

sum_of_values(Map) ->
  maps:fold(fun(_, V, Sum) -> V+Sum end, 0, Map).

min(A,B) when A < B ->
  A;
min(_,B) ->
  B.

min_value(Map)->
  [Element|_] = maps:values(Map),
  maps:fold(fun(_, V, Min) -> min(V,Min) end, Element, Map).

sort_by_keys(Map)->
  Keys = lists:sort(maps:keys(Map)),
  maps:from_list([{Key, maps:get(Key,Map)} || Key <- Keys]).

return_values(Map)->
  maps:values(Map).

merge(M1, M2) ->
  maps:fold(fun(Key, Value, MergedMap) -> maps:put(Key, Value, MergedMap) end, M1, M2).

map(Function, Map) ->
  put_your_solution_here.

to_map(List) ->
  put_your_solution_here.

records_to_maps(Records) ->
  put_your_solution_here.

maps_to_records(Maps) ->
  put_your_solution_here.

proplist_to_map(Proplist) ->
  put_your_solution_here.
