function[num] = rand_range(a,b)
% rand_range(a,b)
%
% return a random value within the range specified (a,b), drawn from a uniform
% distribution
% 
% MANDATORY INPUTS: 
%   a: min value in the range 
%   b: max value in the range 
%
% OUTPUTS: 
%   num: a random number from within the range (a,b)

num = (b-a) .* rand()+a;
end