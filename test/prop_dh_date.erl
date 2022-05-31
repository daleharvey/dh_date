-module(prop_dh_date).
-include_lib("proper/include/proper.hrl").

%%%%%%%%%%%%%%%%%%
%%% Properties %%%
%%%%%%%%%%%%%%%%%%
prop_format1() ->
    ?FORALL(Date, dh_date_term(),
        begin
            Format = "j-M-Y, g:i:s A",
            ParseResult = dh_date:parse(dh_date:format(Format, Date)),
          
            case ParseResult of
                ParseResult 
                    when {error, bad_date} == ParseResult; Date == ParseResult ->
                    true;
                _ -> false
            end

        end
        
	).

%%%%%%%%%%%%%%%%%%
%%% Generators %%%
%%%%%%%%%%%%%%%%%%
dh_date_term() ->
    ?LET(X, 
          {{range(1970,inf), range(1,12),range(1,31)}, {range(12,24),range(0,59), range(0,59)}},
            X).
