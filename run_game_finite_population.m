% run game with a finite population
% population games tool box
clear

global G

% number of populations
P = 1;

% number of agents
N = 21;

% number of pure strategies per population
n = 3;

% mass of the population
m = 1;

% initial condition
x0 = [0.2 .7 0.1]'; 

% simulation parameters
time = 30;

% structure with the parameters of the game
G = struct('N', N, 'n', n, 'f', @fitness1, 'x0', x0, 'ode', 'ode113', 'time', time);

% verify data of the game
G = definition(G);







% set initial state
s = zeros(G.N, G.P);

h = 0;
for i = 1: max(G.S(1))
	p = floor(G.N * G.x0(i, 1));
	if ((p + h) <= G.N) && (p ~= 0)
		s(h + 1: h + p) = i;
		h = h + p;
	end
	
end

% choose a random strategy to complete the initial state vector
if h ~= G.N
	s(h + 1: G.N ) = unidrnd(G.S(1), 1, G.N - h);
end

% function to find the current distribution
%state = @(u, S) sum(u == S);

t_max = floor(G.time);

% Number of agents that update their strategy at each time instant
alarm = poissrnd( G.N * G.R, 1, t_max);

for t = 1: G.time

	% find the current social state 
	z = zeros(G.S(1), 1);
	for i = 1: G.S(1)
		z(i) = sum(s == i) / G.N;
	end

	% find the current payoff of each strategy
	F = zeros(G.S(1), 1) ;
	for i = 1: G.S(1)
		F(i) = G.f(z', 1, i);
	end

	% select users to update their actions at random
	update_agents = unidrnd(G.N, 1, alarm(t));
	
	% procedure to update the strategy of each agent
	for i = 1: alarm(t)
				
		
		
	end


end


