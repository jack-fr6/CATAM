function [outputArg1,outputArg2] = EulerTest(a,N)
%Carries out Euler test for N with base a


%Calculate a^(N-1)/2 mod N
bin=dec2bin((N-1)/2);
        n=numel(num2str(bin));
        f=1;
        while f<= n
            y=num2str(bin);
            d(f)=str2num(y(n-f+1));
            f=f+1;
        end
        e(1)=a;
        f=2;
        while f<= n
            e(f)=mod(e(f-1)^2,N);
            f=f+1;
        end
        h=1;
        q=1;
        D=0;
        while h<=n
            if d(h)==1
                D(q)=e(h);
                q=q+1;
            else
            end
            h=h+1;
        end
        ZZ=size(D,2);
        zz=2;
        t=D(1);
        while zz <= ZZ
            t=mod(D(zz)*t,N);
            zz=zz+1;    
        end
    %Finished calculating a^{p-1}=t
    Power=t;
%Calculated a^(N-1)/2 mod N

%Calculate (a/N)
    d=1;
    b=N;
    J=1;
    if mod(b,2)==0
    d=2;
end

if gcd(a,b) ~= 1
    d=3;
end

if d==2
    disp(['Error'])
elseif d==3
    Jacobi=0;
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
Jacobi=J;

end


%Test to see if Jacobi symbol is equal to power
Test = mod(J-Power,N);

if Test==0
    disp([ 'Pass'])
else 
    disp(['Fail'])
end


%Finish test to see if Jacobi symbol = power



end

