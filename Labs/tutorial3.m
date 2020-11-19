clear all; clc; close all;

 x = linspace(0,1,1000);

 figure; hold on; axis([0 1 0 10]);

 obs = randi([0, 1], 1, 100);

 % Prior distribution

 a = 0; % Prior mean

 b = 1; % Prior variance

 priordist = makedist('Uniform','lower',a,'upper',b); %uniform prior

 prior = pdf(priordist, x);

 plotPrior = plot(x,prior,'k'); % Plot 1: prior distribution

 leg = legend('prior');



% Number of recursive iterations

 for i = 1:100,

 % Likelihood function

 if obs(i) == 0

 m = -1; % gradient

 c = 1; % y intercept

 elseif obs(i) == 1

 m = 1;

 c = 0;

 end

 like = m*x + c;

 l_area = trapz(x,like);

 like_n = like./l_area;

 plotLike = plot(x,like_n); % Plot 3: sample distribution



posterior = prior.*like;

 post_area = trapz(x,posterior);

 post_n = posterior./post_area;

 plotPost = plot(x, post_n, 'r'); % Plot 3: product distribution

 leg = legend('prior', 'likelihood', 'posterior');


 if(i < 100),


 pause(0.0001);



delete(get(leg, 'Children'));



delete(plotPrior);

 delete(plotLike);

 delete(plotPost);



prior = posterior; % Plot 3: product distribution

 prior_area = trapz(x,prior);

 prior_n = prior./prior_area;

 plotPrior = plot(x,prior_n,'k'); % Plot 1: prior distribution

 leg = legend('prior');

 end;

 end;