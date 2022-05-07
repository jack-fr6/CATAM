function [outputArg1,outputArg2] = Q2(aa,A)
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
            
            edig=numel(num2str(e(f-1)));
            if edig >= 7
                esmall=mod(e(f-1),10^6);
                ebig=(e(f-1)-esmall)/10^6;
                
                
                
                prod1=mod(esmall*esmall,p);
                
                tensmall=mod(10^6,p);
                
                prod2a=mod(ebig*ebig,p);
                prod2b=mod(prod2a*tensmall,p);
                prod2=mod(prod2b*tensmall,p);
                
                prod3a=mod(ebig*esmall,p);
                prod3=mod(prod3a*tensmall,p);
                
                prod4a=mod(esmall*ebig,p);
                prod4=mod(prod4a*tensmall,p);
                
                e(f)=mod(prod1+prod2+prod3+prod4,p);
            else
                e(f)=mod(e(f-1)^2,p);
            end
       
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
            
            tdig=numel(num2str(t));
            Ddig=numel(num2str(D(zz)));
                       
            if tdig+Ddig >= 14
                tsmall=mod(t,10^6);
                tbig=(t-tsmall)/10^6;
                Dsmall=mod(D(zz),10^6);
                Dbig=(D(zz)-Dsmall)/10^6;
                
                
                prod1=mod(tsmall*Dsmall,p);
                
                tensmall=mod(10^6,p);
                
                prod2a=mod(tbig*Dbig,p);
                prod2b=mod(prod2a*tensmall,p);
                prod2=mod(prod2b*tensmall,p);
                
                prod3a=mod(tbig*Dsmall,p);
                prod3=mod(prod3a*tensmall,p);
                
                prod4a=mod(tsmall*Dbig,p);
                prod4=mod(prod4a*tensmall,p);
                
                t=mod(prod1+prod2+prod3+prod4,p);
            else
                 t=mod(D(zz)*t,p);
                
                
            end
                    
                
                
                
            
            
            zz=zz+1;    
        end
    %Finished calculating a^{p-1}=t
    if t==1
        B(qq,i)=p;
        i=i+1;
    else
    end
j=j+1;
end
qq=qq+1;
end

B'
stuff=B';
maxim=size(stuff,2);
i=1;
actualprimes=[1000000007;
1000000009;
1000000021;
1000000033;
1000000087;
1000000093;
1000000097;
1000000103;
1000000123;
1000000181];
while i<= maxim
    newstuff(:,i)=setdiff(stuff(:,i),actualprimes);
    i=i+1;
end
newstuff





end

