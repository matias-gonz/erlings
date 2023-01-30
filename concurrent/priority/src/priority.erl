-module(priority).

-export([start/0,
         get_messages/1,
         priority_loop/1]).

start() ->
  spawn(?MODULE, priority_loop, [[]]).

get_messages(Pid) ->
  Pid ! {server, {self(), get_current_messages}},
  receive
    Msgs ->
      Msgs
    end.

priority_loop(State) ->
  receive
    {vip, Msg} ->
      priority_loop([{vip, Msg} | State])
    after 0 ->
      receive
        {server, {Pid, get_current_messages}} ->
          Pid ! lists:reverse(State);
        {Priority, Message} ->
          priority_loop([{Priority, Message} | State])
        end
      end.
