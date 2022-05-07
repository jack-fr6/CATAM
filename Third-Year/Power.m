function [outputArg1,outputArg2] = Power(a,p)

b=dec2bin(p-1)
n=numel(num2str(b));
f=1;
while f<= n
    y=num2str(b);
    d(f)=str2num(y(n-f+1));
    f=f+1;
end
e(1)=a;
f=2;
while f<= n
    e(f)=mod(e(f-1)^2,p);
    f=f+1;
end
e'
h=1;
q=1;
while h<=n
    if d(h)==1
        D(q)=e(h);
        q=q+1;
    else
    end
    h=h+1;
end
D'
d;
e;
D;
ZZ=size(D,2);
zz=2;
t=D(1);
while zz <= ZZ
    t=mod(D(zz)*t,p)
    zz=zz+1;    
end
mod(t,p)
end

