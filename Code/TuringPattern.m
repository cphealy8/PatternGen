function [B,A] = TuringPattern(varargin)
p = inputParser;

addOptional(p,'dims',[128 128],@isnumeric)
addOptional(p,'Ao',[],@isnumeric)
addOptional(p,'Bo',[],@isnumeric)
addOptional(p,'f',.055,@isnumeric)
addOptional(p,'k',.062,@isnumeric)
addOptional(p,'da',1,@isnumeric)
addOptional(p,'db',0.5,@isnumeric)
addOptional(p,'dt',0.25,@isnumeric)
addOptional(p,'stoptime',5000,@isnumeric)

parse(p,varargin{:});
dims = p.Results.dims;
Ao = p.Results.Ao;
Bo = p.Results.Bo;
f = p.Results.f;
k = p.Results.k;
da = p.Results.da;
db = p.Results.db;
dt = p.Results.dt;
stoptime = p.Results.stoptime;



% Diffusion rates

% Size of grid
width = dims(2);
height = dims(1);

% 5,000 simulation seconds with 4 steps per simulated second
t=0;
[t, AD, BD] = initial_conditions(width,height);
if isempty(Ao)
    A = AD;
else
    A = Ao;
end

if isempty(Bo)
    B = BD;
else
    B = Bo;
end

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
% imagesc(B);
end

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



