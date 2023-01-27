-module(lists_exercises).

-export([reverse/1,
         rmconsecutive/1,
         even_fib_numbers/0,
         foldl/3,
         foldl/2,
         rotate/2,
         run_length_encode/1,
         list_any/2,
         anagram/2,
         last_letter/1]).

reverse(List) ->
  reverse(List, []).

reverse([], NewList) ->
  NewList;
reverse([Head|Tail], NewList) ->
  reverse(Tail, [Head | NewList]).

rmconsecutive(List) ->
  rmconsecutive(List, [], none).

rmconsecutive([], NewList, _) ->
  reverse(NewList);
rmconsecutive([H|T], NewList, H) ->
  rmconsecutive(T, NewList, H);
rmconsecutive([H|T], NewList, _) ->
  rmconsecutive(T, [H|NewList], H).

even_fib_numbers() ->
  even_fib_numbers(1, 2, 0).

even_fib_numbers(_, B, Sum) when B >= 4000000 ->
  Sum;
even_fib_numbers(A, B, Sum) when B rem 2 =:= 0 ->
  even_fib_numbers(B, A+B, Sum+B);
even_fib_numbers(A, B, Sum) ->
  even_fib_numbers(B, A+B, Sum).


foldl(_, Acc, []) ->
  Acc;
foldl(Fun, Acc, [H|T]) ->
  foldl(Fun, Fun(Acc, H), T).

foldl(_, List) when length(List) < 2 ->
  undefined;
foldl(Fun, [A, B | T]) ->
  foldl(Fun, A, [B|T]).

rotate(List, {_, 0}) ->
  List;
rotate([H|T], {left, N}) ->
  L = [H | reverse(T)],
  rotate(reverse(L), {left, N-1});
rotate([H|T], {right, N}) ->
  [Last|TailLast] = reverse([H|T]),
  rotate([Last | reverse(TailLast)], {right, N-1}).


run_length_encode(L) ->
  run_length_encode(L,[]).

run_length_encode([], EncodedList) ->
  reverse(EncodedList);
run_length_encode([H|T], [{N, H}|EncodedList]) ->
  run_length_encode(T, [{N+1, H}|EncodedList]);
run_length_encode([H|T], EncodedList) ->
  run_length_encode(T, [{1,H}] ++ EncodedList).


list_any(_, _, []) ->
  false;
list_any(_, true, _) ->
  true;
list_any(Fun, false, [H|T]) ->
  list_any(Fun, Fun(H), T).

list_any(Fun, List) ->
  list_any(Fun, false, List).

is_anagram(A,A) ->
  false;
is_anagram(A, B) ->
  lists:sort(A) == lists:sort(B).

anagram(List, S) -> 
  [X || X <- List, is_anagram(string:lowercase(S),string:lowercase(X))].

last_letter([H|T]) ->
  Letter = lists:sublist(reverse(H),1,1),
  last_letter(T,[H], Letter).

last_letter([],List,_) ->
  reverse(List);
last_letter([Word|T], List, Letter) ->
  FirstLetter = lists:sublist(Word,1,1),
  StartsWithLastLetter = string:lowercase(FirstLetter) =:= string:lowercase(Letter),
  case StartsWithLastLetter of
        true ->
            LastLetter = lists:sublist(reverse(Word),1,1),
            last_letter(T, [Word|List], LastLetter);
        false ->
            last_letter(T,List,Letter)
    end.
  

  

