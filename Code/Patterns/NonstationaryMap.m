fun = @(x,y) 1./(1+exp(-0.05*(x-dx/2)));
NSMap = NormRange(Func2Signal(fun,win,dx),[0 1]);