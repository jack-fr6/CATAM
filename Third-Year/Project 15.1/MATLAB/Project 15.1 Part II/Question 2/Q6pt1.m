function [outputArg1,outputArg2] = Q6pt1(kmin,kmax,base)

ppc=zeros(kmax-kmin+1,3);
%prime(1,:)=ones(1,3)*8392;
%prime(2,:)=ones(1,3)*7216;
%prime(3,:)=ones(1,3)*6241;
%prime(4,:)=ones(1,3)*5411;
%prime(5,:)=ones(1,3)*4832;
prime(1,:)=ones(1,3)*159;

ppc=ppc-prime;

k=kmin;

while k<=kmax
    p=10^k;
    
    
while p<= (10^k)+(10^3)


basemax=size(base,2);

%strong test

baseindex=1;
strongterminate=0;
while baseindex<= basemax && strongterminate==0
    a=base(baseindex);
    
    %run strong test
    
         greatestcommon = gcd(a,p);
                if greatestcommon == 1
                        %Find r and odd s with N-1=s2^r
                        clear X,
                                        r=0;
                                        N=p;
                                        Q=p-1;
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
                                                if e(f-1) >= 10^5
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
                                                 if t*D(zz) >= 10^10
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

                                           Power=t;
                                           if Power == p-1;
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
                                            strongterminate=0;
                                        elseif all( X ~= -1)
                                            strongterminate=1;
                                        else
                                            strongterminate=0;
                                        end
                                        baseindex=baseindex+1;
                else
                    strongterminate=1;
                   
                end
end

if strongterminate==0
    ppc(k-kmin+1,3)=ppc(k-kmin+1,3)+1;
end

baseindex=1;
eulterminate=0;

while baseindex<= basemax && eulterminate==0
    
    %do fermat test
        a=base(baseindex);
        p;
                greatestcommon = gcd(a,p);
                N=p;
                if gcd(p,2) ~= 1 || gcd(a,p)~=1;
                    
                    eulterminate=1;
                    
                else 
                        bin=dec2bin((p-1)/2);
                            n=numel(num2str(bin));
                            f=1;
                            d=0;
                            while f<= n
                                y=num2str(bin);
                                d(f)=str2num(y(n-f+1));
                                f=f+1;
                            end
                            e=0;
                            e(1)=a;
                            f=2;
                            while f<= n
                                
                            if e(f-1) >= 10^5
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
                                   

                                    if t*D(zz) >= 10^10
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

                            aa=a;

                    while aa ~= 1
                           aa=mod(aa,b);
                        while mod(aa,2)==0
                          J=(-1)^(((b^2)-1)/8)*J;
                          aa=aa/2;
                        end
                        J=(-1)^(((aa-1)*(b-1))/4)*J;
                        A=aa;
                        aa=b;
                        b=A;
                        aa=mod(aa,b);

                        if mod(aa+1,b)== 0
                            J=(-1)^((b-1)/2)*J;
                            aa=1;
                        end
                    end
                    Jacobi=J;

                    end


                    %Test to see if Jacobi symbol is equal to power
                    Test = mod(J-Power,N);
                    
                    if Test==0
                        baseindex=baseindex+1;
                        eulterminate=0;
                    else
                        eulterminate=1;
                    end
                    
                end








                                    
                                    




    



end

if eulterminate==0
    ppc(k-kmin+1,2)=ppc(k-kmin+1,2)+1;
end

baseindex=1;
ferterminate=0;

while baseindex<= basemax && ferterminate==0
    a=base(baseindex);
    greatestcommon = gcd(a,p);
                if greatestcommon == 1
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
                            if edig >= 5
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

                            if tdig+Ddig >= 10
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
                        baseindex=baseindex+1;
                        ferterminate=0;
                    else
                        ferterminate =1;
                    end
                    
                else
              
                        ferterminate=1;
                end
end

if ferterminate==0
    ppc(k-kmin+1,1)=ppc(k-kmin+1,1)+1;
end

p=p+1;
end
k=k+1;
end
ppc




                    
                    
        
        
    
    
    
    
    



end

