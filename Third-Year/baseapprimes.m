function [outputArg1,outputArg2] = baseapprimes(aa,A)

rr=size(aa,2);
qq=1;
while qq<= rr
a=aa(qq);

i=1;
j=1;
B(qq,1)=0;
k=size(A,2);
while j<=k
    p=A(j);
    %Calculate a^{p-1}=t
        bin=dec2bin(p-1);
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
            e(f)=mod(e(f-1)^2,p);
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
            t=mod(D(zz)*t,p);
            zz=zz+1;    
        end
    %Finished calculating a^{p-1}=t
    if t==1
        %run prime check by trial division
        check=2;
        ttt=0;
        while check<= sqrt(p) && ttt==0
            if gcd(check,p)==check
                ttt=1;
            else
                check=check+1;
            end
        end
        
        if ttt==1
            B(qq,i)=p;
            i=i+1;
        end
            
        
        
        
        
        
    else
    end
j=j+1;
end
qq=qq+1;
end

B'
end

