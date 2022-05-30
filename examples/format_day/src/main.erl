-module(main).

%% API exports
-export([main/1]).

%%====================================================================
%% API functions
%%====================================================================

%% escript Entry point
main(_Args) ->
    % LocalTime = calendar:local_time(),
    LocalTime = {{2022,2,3},{}},
    io:fwrite("~26s | ~8s | ~p~n", ["Descrption", "Format", element(1,LocalTime)]),
    io:format("~56c~n",[$-]),

    %% Date Formats
    %% General format of a control sequence is
    %% "Month/Day/Year"

    % Control values:
    %
    % Year
    % Y y L o

    % Month
    % n m M F t

    % Week
    % W

    % Day
    % j S d D l N w Z 

    fun() ->     
        Format = "n/j/Y",
        print(Format, LocalTime, "Month/Day/Year")
    end(),

    fun() ->     
        Format = "m/j/Y",
        print(Format, LocalTime, "Month/Day/Year")
    end(),

    fun() ->     
        Format = "m-j-Y",
        print(Format, LocalTime, "Month-Day-Year")
    end(),

    fun() ->     
        Format = "m\\\\j\\\\Y",
        print(Format, LocalTime, "Month\\Day\\Year")
    end(),
    
    fun() ->     
        Format = "m:j:Y",
        print(Format, LocalTime, "Month:Day:Year")
    end(),

    fun() ->     
        Format = "m.j.Y",
        print(Format, LocalTime, "Month.Day.Year")
    end(),

    fun() ->     
        Format = "m, j, Y",
        print(Format, LocalTime, "Month, Day, Year")
    end(),

    fun() ->     
        Format = "mjY",
        print(Format, LocalTime, "Month, Day, Year")
    end(),

    fun() ->     
        Format = "j/m/Y",
        print(Format, LocalTime, "Day/Month/Year")
    end(),

    fun() ->     
        Format = "Y/j/m",
        print(Format, LocalTime, "Year/Month/Day")
    end(),

    fun() ->     
        Format = "M j, Y",
        print(Format, LocalTime, "Month Day, Year")
    end(),

    fun() ->     
        Format = "j M, Y",
        print(Format, LocalTime, "Day Month, Year")
    end(),

    fun() ->     
        Format = "F j, Y",
        print(Format, LocalTime, "Month Day, Year")
    end(),

    fun() ->     
        Format = "Y, j M",
        print(Format, LocalTime, "Year, Day Month")
    end(),

    fun() ->     
        Format = "n/j/Y",
        print(Format, LocalTime, "Month/Day/Year")
    end(),
    
    fun() ->     
        Format = "Y/m/d",
        print(Format, LocalTime, "Year/Month/Day")
    end(),

    fun() ->     
        Format = "D j M Y",
        print(Format, LocalTime, "DayOfWeek Day Month Year")
    end(),

    fun() ->     
        Format = "l j M Y",
        print(Format, LocalTime, "DayOfWeek Day Month Year")
    end(),

    erlang:halt(0).

%%====================================================================
%% Internal functions
%%====================================================================

print(Format, LocalTime, Description) ->
    FormattedTime = dh_date:format(Format, LocalTime),
    io:format("~26s | ~8s | ~16s~n", [Description, Format, FormattedTime]).