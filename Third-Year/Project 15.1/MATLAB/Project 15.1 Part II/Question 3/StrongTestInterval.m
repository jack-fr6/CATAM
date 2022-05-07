function [outputArg1,outputArg2] = StrongTestInterval(a,Nmin,Nmax)

N=Nmin;
primeindex=1;

while N<= Nmax
    N;
    clear X Q r s f n bin e h q D ZZ zz t Power i j X d


%Find r and odd s with N-1=s2^r
    r=0;
    Q=N-1;
    while mod(Q,2)==0
        r=r+1;
        Q=Q/2;
    end
    s=(N-1)/(2^r);
%Found s and r


%Find Power = a^s mod N
    

        bin=dec2bin(s);
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

       Power=t;
       if Power == N-1
           Power= -1;
       end
%Calculated a^s mod N


%Calculate X=(a^s,...,a^2^r-1 s)

    i=2;
    X(1)=Power;
    while i<= r
        X(i)=mod((X(i-1))^2,N);
        if X(i)==N-1;
            X(i)=-1;
        end
        i=i+1;
        
    end
    X;
%Calculated X

%Carry out test
    if X(1)==1
        %disp([ 'Pass'])
        strongprime(primeindex)=N;
        primeindex=primeindex+1;
    elseif all( X ~= -1)
        %disp([ 'Fail'])
    else
        %disp([ 'Pass'])
        strongprime(primeindex)=N;
        primeindex=primeindex+1;
        
    end
%Carried out test
N=N+1;
end
strongprime.'

end

