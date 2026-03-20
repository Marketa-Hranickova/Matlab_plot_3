function p = parameters_3()
    p.a = 0; 
    p.b = 0;

    p.J = @(x1, x2, a, b) (x1 - a).^2 + (x2 - b).^2;

    p.grad = @(x1, x2, a, b) [2*(x1 - a); 2*(x2 - b)];

    p.alpha = [1; 1];
    p.beta = [1; 1];
    p.eps = 1e-3;
    p.k = [1; 2; 3; 4; 5; 6]; 
    p.d = 1e-3;
    p.omega = (2 * pi)/p.d;
end