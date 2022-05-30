REBAR := $(shell which rebar3 2>/dev/null || echo ./rebar3)
REBAR_URL := https://s3.amazonaws.com/rebar3/rebar3

.PHONY: rel stagedevrel deps test

all: deps compile

compile: $(REBAR)
	       $(REBAR) compile

deps: $(REBAR)
	    $(REBAR) get-deps

clean: $(REBAR)
	     $(REBAR) clean

test: $(REBAR)
	    $(REBAR) do compile, eunit

##
## Doc targets
##
docs: $(REBAR)
	$(REBAR) edoc

doc_private: $(REBAR)
	           $(REBAR) as doc_private edoc

exdoc: $(REBAR)
	           $(REBAR) ex_doc --output exdoc --formatter html

./rebar3:
	erl -noshell -s inets start -s ssl start \
        -eval '{ok, saved_to_file} = httpc:request(get, {"$(REBAR_URL)", []}, [], [{stream, "./rebar3"}])' \
        -s inets stop -s init stop
	chmod +x ./rebar3

APPS = kernel stdlib sasl erts ssl tools os_mon runtime_tools crypto inets \
	xmerl webtool snmp public_key mnesia eunit syntax_tools compiler
COMBO_PLT = $(HOME)/.riak_combo_dialyzer_plt

check_plt: compile
	dialyzer --check_plt --plt $(COMBO_PLT) --apps $(APPS)

build_plt: compile
	dialyzer --build_plt --output_plt $(COMBO_PLT) --apps $(APPS)

dialyzer: compile
	@echo
	@echo Use "'make check_plt'" to check PLT prior to using this target.
	@echo Use "'make build_plt'" to build PLT prior to using this target.
	@echo
	@sleep 1
	dialyzer -Wno_return --plt $(COMBO_PLT) ebin | \
	    fgrep -v -f ./dialyzer.ignore-warnings

cleanplt:
	@echo 
	@echo "Are you sure?  It takes about 1/2 hour to re-build."
	@echo Deleting $(COMBO_PLT) in 5 seconds.
	@echo 
	sleep 5
	rm $(COMBO_PLT)

