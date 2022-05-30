-module(main).

%% API exports
-export([main/1]).

%%====================================================================
%% API functions
%%====================================================================

%% escript Entry point
main(_Args) ->
    LocalTime = calendar:local_time(),
    Minus12Hours = calendar:gregorian_seconds_to_datetime(
        calendar:datetime_to_gregorian_seconds(LocalTime) - 12*60*60),
    io:fwrite(" ~8s | ~p | ~p~n", ["Format", LocalTime, Minus12Hours]),
    io:format("~64c~n",[$-]),

    %% Time Formats
    %% General formats of a control sequence are
    %% "H:i:s a", "h:i:s a"
    %% "G:i:s a", "G:i:s a" 

    fun() ->     
        Format = "H:i:s a",
        print(Format, LocalTime, Minus12Hours)
    end(),

    fun() ->     
        Format = "h:i:s a",
        print(Format, LocalTime, Minus12Hours)
            
    end(),

    fun() ->     
        Format = "G:i:s a",
        print(Format, LocalTime, Minus12Hours)    
    end(),

    fun() ->     
        Format = "g:i:s a",
        print(Format, LocalTime, Minus12Hours)
            
    end(),

    erlang:halt(0).

%%====================================================================
%% Internal functions
%%====================================================================

print(Format, LocalTime, Minus12Hours) ->
    FormattedTime = dh_date:format(Format, LocalTime),
    FormattedTime2 = dh_date:format(Format, Minus12Hours),
    io:format(" ~8s | ~24s | ~24s~n", [Format, FormattedTime, FormattedTime2]).
