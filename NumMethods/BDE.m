clearvars;
close all;
mu = 1;
alpha = 0;
b = 0;
c =0;
d =0;
L = 1;
Counts = 10.^(1:10);
Y_estim = zeros(length(Counts));
Y_real = zeros(length(Counts));
i = 1;
for N = Counts
    
    h = L/(N+1);
    x = (h:h:L-h);
    
    D2 = diag(-2 *ones(N,1)) +diag(ones(N-1,1),1) + diag(ones(N-1,1),-1);
    D2 = 1/h^2 * D2;
    
    D1 = diag(0*ones(N,1)) + diag(ones(N-1,1),1)+diag(-1 * ones(N-1,1),-1);
    D1 = 1/(2*h) * D1;
    
    I = diag(ones(N,1));
    
    A = -mu* D2 + alpha * D1 + b*I;
    
    F = f(x);
    F(1) = F(1) + (alpha/(2*h) + mu/h^2)*c;
    F(end) =  F(end) - (alpha/(2*h) - mu/h^2)*d;
    U = A\F';
    X =[0,x,L];
    Y_estim(i) = [c,U',d];
    Y_real(i) = f([0,x,L])/(pi^2 * mu);
    i= i+1
    %plot(X,Y_estim);
    %hold on
    %plot(X,Y_real);
    %hold off
    %plot(X,abs(Y_real - Y_estim))
end
%loglog(X,abs(Y_real - Y_estim))

L1 = 1/(N+2)* sum(abs(Y_estim - Y_real));


function res = f(x)
    res = sin(pi*x);
end

