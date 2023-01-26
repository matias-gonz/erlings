-module(hello_pattern).

-export([hello/1]).

hello({morning, _}) ->
  morning;
hello({evening, Name}) ->
  {good, evening, Name};
hello({night, _}) ->
  night;
hello({math_class, Number, _}) when Number < 0 ->
  none;
hello({math_class, _, Name}) ->
  {math_class, Name};
hello(_) ->
  none.
