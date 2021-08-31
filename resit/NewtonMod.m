% CM2208 Newton's Method (modified for visualConvergence2)
% Input: function f, df (derivative of f), initial guess p0, 
% tolerance (as relative error)
% N0 (max. iterations)
% Output: the value p
function result = NewtonMod(f, df, p0, tol, max)
% fprintf('Newton\n');
% fprintf('%3d:%16.9f\n', 0, previous_value); 
%Step 1:
i = 1;
%Step 2:
while i <= max
   %Step 3:
   last = p0;
   p = p0 - f(p0)/df(p0);
   if isnan(p)
       break
   end
%    fprintf('%3d:%16.9f\n', iteration, current_value); 
   %Step 4:
   if abs(p - p0) < tol
%        fprintf('Solution found p = %g\n', current_value);
         result = [p, i];
       return
   end
   %Step 5:
   i = i + 1;
   %Step 6:
   p0 = p;
end
result = [nan, log(abs(p-last))];
% fprintf('Method failed after %d iterations\n', max_iterations);
return
end

%pn = p
%pn-1 = p0

%format of return value
% [converged to, iterations]
% [nan, log value]