for i=1:max(size(rho_g))
    hold on;
    grid on;
    for j=1:max(size(tau_g))
        
   if(isnan(sol(i,j)))
  plot(rho_g(i), tau_g(j),'xk', 'MarkerSize',15);
   else
  plot(rho_g(i), tau_g(j),'ok', 'MarkerSize',15);
   end
    end
end