-module(insert_element_at).

-export([insert/3]).

insert(List, Pos, Element) ->
  insert(List,[],Pos-1,Element).

get_current_element(#{current := Current, old := _}) -> Current;
get_current_element(Current) -> Current.

insert([H|T], Acc, 0, Element) ->
  NewElement = #{current => Element, old => get_current_element(H)},
  Acc ++ [NewElement] ++ T;
insert([H|T], Acc, Pos, Element) ->
  insert(T, Acc ++ [H], Pos-1, Element).
