function p = parameters_3()
    % Cílové parametry
    p.a = 0; 
    p.b = 0;
    
    % DEFINICE FUNKCÍ (Anonymní funkce)
    % Formát: @(vstupy) předpis
    p.J = @(x1, x2, a, b) (x1 - a).^2 + (x2 - b).^2;
    
    % Gradient (derivace podle x1 a x2)
    % Vrací sloupcový vektor [derivace_podle_x1; derivace_podle_x2]
    p.grad = @(x1, x2, a, b) [2*(x1 - a); 2*(x2 - b)];
    
    % Ostatní parametry pro modely
    p.alpha = [1; 1];
    p.beta = [1; 1];
    p.eps = 1e-6;
    p.k = [1; 2; 3; 4; 5;6]; 
    p.phi_1 = (g(1)/sqrt(v(1)+p.eps));
    p.phi_2 = (g(2)/sqrt(v(2)+p.eps));   
    p.psi_11 = p.J;
    p.psi_12 = p.J;
    p.psi_21 = p.J;
    p.psi_22 = p.J;
    p.d = 1e-2;
    p.omega = (2 * pi)/p.d;
end