function [Jacobi] = Jacobi(a,b)
%Input integers a,b with b odd
%Returns Jacobi symbol (a/b)
x=a;
y=b;
J=1;
d=1;
if mod(b,2)==0
    d=2;
end

if gcd(a,b) ~= 1
    d=3;
end

if d==2
    disp(['Error'])
elseif d==3
    disp(['Jacobi Symbol (' num2str(x) '/' num2str(y) ') =' num2str(0)])
else



while a ~= 1
       a=mod(a,b);
    while mod(a,2)==0
      J=(-1)^(((b^2)-1)/8)*J;
      a=a/2;
    end
    J=(-1)^(((a-1)*(b-1))/4)*J;
    A=a;
    a=b;
    b=A;
    a=mod(a,b);

    if mod(a+1,b)== 0
        J=(-1)^((b-1)/2)*J;
        a=1;
    end
end
disp(['Jacobi Symbol (' num2str(x) '/' num2str(y) ') =' num2str(J)])

end

end

