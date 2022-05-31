-module(main).

%% API exports
-export([main/1]).

%%====================================================================
%% API functions
%%====================================================================

%% escript Entry point
main(_Args) ->
    LocalTime = calendar:local_time(),
    Format = "j-M-Y, g:i:s A",
    ParseResult  = dh_date:parse("29-Feb-1971, 12:00:00 AM"),
    io:format("format. ~p~n", [ParseResult]),
    erlang:halt(0).

%%====================================================================
%% Internal functions
%%====================================================================
