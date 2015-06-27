%%%---------------------------------------------
%%% @author Sam Johnson
%%% @doc Module that implements the Application
%%%   behavior for the TCP RPC app
%%% @end
%%%---------------------------------------------
-module(tr_app).

-behaviour(application).

%% application callbacks
-export([start/2, stop/1]).

%%%=============================================
%%% Application callbacks
%%%=============================================

%%---------------------------------------------
%% @doc Start the root supervisor
%%---------------------------------------------

start(_Type, _StartArgs) ->
    case tr_sup:start_link() of
        {ok, Pid} ->
            {ok, Pid};
        Other ->
            {error, Other}
    end.

%%---------------------------------------------
%% @doc Stop the application
%%---------------------------------------------

stop(_State) ->
    ok.
