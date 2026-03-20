function dydt = complex_3(t, y, p)
    x1 = y(1); x2 = y(2); 
    v1 = y(3); v2 = y(4);
    
    g = p.grad(x1, x2, p.a, p.b); 
    valJ = p.J(x1, x2, p.a, p.b);

    phi_1 = (valJ/sqrt(v1^2+p.eps));
    phi_2 = (valJ/sqrt(v2^2+p.eps));   
    psi_11 = valJ;
    psi_12 = valJ;
    psi_21 = valJ;
    psi_22 = valJ;

    if p.case_type == 1
        
        phi_2 = 1;   
        psi_11 = 1;
        psi_12 = 0;
        psi_22 = 0;
    else
        phi_1 = sin(valJ/sqrt(v1^2+p.eps)); 
        phi_2 = cos(valJ/sqrt(v2^2+p.eps));   
        psi_11 = 1;
        psi_12 = 0;
        psi_22 = 0;     
    end
    
    dx1 = sqrt(2*p.omega*p.k(1))*(phi_1*cos(p.k(1)*p.omega*t) + phi_2*sin(p.k(1)*p.omega*t)) + sqrt(2*p.beta(1)*p.omega)*(sqrt(p.k(3))* psi_11*cos(p.k(3)*p.omega*t)) + (sqrt(2*p.omega*p.k(5))* psi_12*cos(p.k(5)*p.omega*t));
    dx2 = sqrt(2*p.omega*p.k(2))*(phi_1*cos(p.k(2)*p.omega*t) + phi_2*sin(p.k(2)*p.omega*t)) + sqrt(2*p.beta(2)*p.omega)*(sqrt(p.k(4))* psi_11*cos(p.k(4)*p.omega*t)) + (sqrt(2*p.omega*p.k(6))* psi_12*cos(p.k(6)*p.omega*t));
    dv1 = -p.beta(1)*v1+sqrt(2*p.beta(1)*p.omega)*(sqrt(p.k(3))*psi_21*sin(p.k(3)*p.omega*t))+ sqrt(2*p.omega*p.k(5))*psi_22*sin(p.k(5)*p.omega*t);
    dv2 = -p.beta(2)*v2+sqrt(2*p.beta(2)*p.omega)*(sqrt(p.k(4))*psi_21*sin(p.k(4)*p.omega*t))+ sqrt(2*p.omega*p.k(6))*psi_22*sin(p.k(6)*p.omega*t);
    
    dydt = [dx1; dx2; dv1; dv2];
    
end