% CM2208 Halley's Method
% Input: function f, df (derivative of f), initial guess p0, 
% tolerance (as relative error)
% N0 (max. iterations)
% Output: the value p
function p = superHalley(f, df, df2, p0, TOL, N0)
fprintf('Halley\n');
fprintf('%3d:%16.9f\n', 0, p0); 
%Step 1:
i = 1;
%Step 2:
while i <= N0
   %Step 3:
   p = p0 - (f(p0)./df(p0)) - (((f(p0).*df2(p0)))./((df(p0).^2)-(f(p0).*df2(p0)))).*((f(p0)./2.*df(p0)));
   fprintf('%3d:%16.9f\n', i, p); 
   %Step 4:
   if abs(p - p0) < TOL
       fprintf('Solution found p = %g\n', p);
       return
   end
   %Step 5:
   i = i + 1;
   %Step 6:
   p0 = p;  
end
% p = NaN;
fprintf('Method failed after %d iterations\n', N0);

end


%pn = p
%pn-1 = p0