function [outputArg1,outputArg2] = pseudo(a,p)

    
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
        D
        ZZ=size(D,2);
        zz=2;
        t=D(1);
        while zz <= ZZ
            tsize=numel(num2str(t));
            Dsize=numel(num2str(D(zz)));
            t=mod(D(zz)*t,p);
            zz=zz+1;    
        end
        t
    %Finished calculating a^{p-1}=t
    if t==1
        disp(['pass'])
    else
        disp(['fail'])
    end







end

