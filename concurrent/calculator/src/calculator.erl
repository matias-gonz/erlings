-module(calculator).
-export([start_calculator/0,
         calculator_server/0,
         turn_off/1,
         add/3,
         subtract/3,
         multiply/3,
         divide/3]).

start_calculator() ->
  spawn(?MODULE, calculator_server, []).

calculator_server() ->
  receive
    {From, add, A, B} ->
      From ! A + B,
      calculator_server();
    {From, subtract, A, B} ->
      From ! A - B,
      calculator_server();
    {From, multiply, A, B} ->
      From ! A * B,
      calculator_server();
    {From, divide, A, B} ->
      From ! A / B,
      calculator_server();
    terminate ->
      ok
    end.

turn_off(Pid) ->
  Pid ! terminate.

request_operation(CalculatorPid, Operation, A, B) ->
  CalculatorPid ! {self(), Operation, A, B},
  receive
    Result ->
      Result
    end.

add(Pid, A, B) ->
  request_operation(Pid, add, A, B).

subtract(Pid, A, B) ->
  request_operation(Pid, subtract, A, B).

multiply(Pid, A, B) ->
  request_operation(Pid, multiply, A, B).

divide(Pid, A, B) ->
  request_operation(Pid, divide, A, B).