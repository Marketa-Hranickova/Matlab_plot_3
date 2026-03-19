function dydt = complex_3(t, y, p)
     x1 = y(1); x2 = y(2); 
    v1 = y(3); v2 = y(4);
    
    g = p.grad(x(1), x(2), p.a, p.b);
    valJ = p.J(x(1), x(2), p.a, p.b);


    if p.case_type == 1
        
        p.phi_2 = 1;   
        p.psi_11 = 1;
        p.psi_21 = 0;
        p.psi_22 = 0;
    else
        p.phi_1 = cos(p.phi_1); 
        p.phi_2 = sin(p.phi_2);   
        p.psi_11 = 1;
        p.psi_21 = 0;
        p.psi_22 = 0;     
    end
    
    dx1 = sqrt(2*p.omega*p.k(1))*p.phi_1*cos(k(1)*p.omega*t);
    dx2 = sqrt(2*p.omega*p.k(1))*p.phi_1*cos(k(1)*p.omega*t);
    dv1 = sqrt(2*p.omega*p.k(1))*p.phi_1*cos(k(1)*p.omega*t);
    dv2 = sqrt(2*p.omega*p.k(1))*p.phi_1*cos(k(1)*p.omega*t);
    
    dydt = [dx1; dx2; dv1; dv2];
    
end