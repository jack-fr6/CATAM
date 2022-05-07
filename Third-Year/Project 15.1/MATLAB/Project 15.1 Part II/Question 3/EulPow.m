function [powerforeulertest] = EulPow(a,N)
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

end

