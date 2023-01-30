-module(parallel_map).
-export([pmap/2, process_element/3]).

process_element(From, Fun, Element) ->
  From ! {self(), Fun(Element)}.

pmap(Fun, List) ->
  pmap(Fun, List, []).

pmap(_, [], Acc) ->
  Acc;
pmap(Fun, [H|T], Acc) ->
  Pid = spawn(parallel_map, process_element, [self(), Fun, H]),
  receive
    {Pid, Element} ->
      pmap(Fun, T, Acc ++ [Element])
    end.
