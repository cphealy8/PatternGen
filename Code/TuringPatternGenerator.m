Signal
f=.055;
k=.062;

% Diffusion rates
da = 1;
db = .5;
% Size of grid
width = 128;
height = 64;

% 5,000 simulation seconds with 4 steps per simulated second
dt = .25;
stoptime = 5000;

[t, A, B] = initial_conditions(width,height);

% Simulations
nframes=0;
while t<stoptime
    anew = A + (da*my_laplacian(A) - A.*B.^2 + f*(1-A))*dt;
    bnew = B + (db*my_laplacian(B) + A.*B.^2 - (k+f)*B)*dt;
    A = anew;
    B = bnew;
    t = t+dt;
    nframes = nframes+1;
end


%% Display
signal = B;
imagesc(B);

%% Functions
function out = my_laplacian(in)
  out = -in ...
      + .20*(circshift(in,[ 1, 0]) + circshift(in,[-1, 0])  ...
      +      circshift(in,[ 0, 1]) + circshift(in,[ 0,-1])) ...
      + .05*(circshift(in,[ 1, 1]) + circshift(in,[-1, 1])  ...
      +      circshift(in,[-1,-1]) + circshift(in,[ 1,-1]));
  
end

function [t, A, B] = initial_conditions(width,height)
  t = 0;
  % Initialize A to one
  A = ones(width,height);
  % Initialize B to zero which a clump of ones
  B = zeros(width,height);
  B(ceil((width/128)*[51:60]) ,ceil((height/128)*[51:70])) = 1;
  B(ceil((width/128)*[61:80]),ceil((height/128)*[71:80])) = 1;
end
%https://blogs.mathworks.com/graphics/2015/03/16/how-the-tiger-got-its-stripes/



