function dydt = simple_plot_3(t, y, p)
    x1 = y(1); x2 = y(2); 
    v1 = y(3); v2 = y(4);
    
    % Výpočet gradientu z parametrů
    g = p.grad(x1, x2, p.a, p.b);

    p.case_type = case_number;
    
    % Diferenciální rovnice
    dx1 = - (p.alpha(1) * g(1)) / sqrt(v1^2 + p.eps);
    dx2 = - (p.alpha(2) * g(2)) / sqrt(v2^2 + p.eps);
    dv1 = - p.beta(1) * (v1 - g(1));
    dv2 = - p.beta(1) * (v2 - g(2));
    
    dydt = [dx1; dx2; dv1; dv2];
end