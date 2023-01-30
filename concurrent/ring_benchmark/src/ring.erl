-module(ring).
-export([ring/2]).

%% N processes, M messages
ring(N, M) ->
  Parent = self(),
  Processes = [spawn_link(fun () -> node_ring(Parent) end)
               || _ <- lists:seq(1, N)],
  [H|T] = lists:append(lists:duplicate(M, Processes)),
  H ! {msg, T},
  receive
    done ->
      done
  end.
  
node_ring(Parent) ->
  receive
    {msg, []} -> Parent ! done;
    {msg, [H|T]} ->
      H ! {msg, T},
      node_ring(Parent)
    end.