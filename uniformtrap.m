function [sum] = uniformtrap(a,b,n)
%UNIFORMTRAP Estimates and integral using uniform trapezoid rule
%   Must be paired with ftrap function
h = (b-a)/n;
sum = (ftrap(a)+ftrap(b))/2;
for i = 1:(n-1)
    x = a+(i*h);
    sum = sum+ftrap(x);
end
sum = sum*h;


end

