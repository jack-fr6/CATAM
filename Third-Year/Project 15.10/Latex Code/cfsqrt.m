function [outputArg1,outputArg2] = cfsqrt(N,max)

x(1)=sqrt(N);
a(1)=floor(x(1));
r(1)=0;
s(1)=1;

i=2;

while i<= max
    r(i)=-(r(i-1)-(s(i-1)*a(i-1)));
    s(i)=-(((r(i-1)^2-N)/s(i-1))-(2*r(i-1)*a(i-1))+(s(i-1)*(a(i-1)^2)));
    x(i)=(r(i)+sqrt(N))/s(i);
    a(i)=floor(x(i));
    i=i+1;
end
a








end

