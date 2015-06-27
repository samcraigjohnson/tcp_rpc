%%%---------------------------------------------
%%% @author Sam Johnson
%%% @doc Root supervisor for RPC application
%%%
%%% @end
%%%---------------------------------------------
-module(tr_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%%=============================================
%%% API
%%%=============================================

%%---------------------------------------------
%% @doc Start the root supervisor
%%---------------------------------------------
start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%%=============================================
%%% Supervisor callbacks
%%%=============================================

%%---------------------------------------------
%% @doc initalize the root supervisor
%%---------------------------------------------
init([]) ->
    Server = {tr_server, {tr_server, start_link, []},
              permanent, 2000, worker, [tr_server]},
    Children = [Server],
    RestartStrategy = {one_for_one, 0, 1},
    {ok, {RestartStrategy, Children}}.
