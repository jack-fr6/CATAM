function [outputArg1,outputArg2] = Q5(range)
rangeindex=1;
rangemax=size(range,2);
indexing=1;
otherindexing=1;
abspseudo(1,:)=[0,0];
nonprime(1,:)=[0,0];
while rangeindex <= rangemax
    p=range(rangeindex);
    p;
    a=2;
    terminatetest=0;
    while terminatetest==0 && a<= p-1
        %do fermat test
                greatestcommon = gcd(a,p);
                if greatestcommon ==1
                        %Find r and odd s with N-1=s2^r
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
                                                if e(f-1) >= 10^7
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
                                                 if t*D(zz) >= 10^143
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
                                            a=a+1;
                                        elseif all( X ~= -1)
                                            nonprime(indexing,:)=[p,a-1];
                                            indexing=indexing+1;
                                            terminatetest=1;
                                        else
                                            a=a+1;
                                        end
                                    %Carried out testr
                    
        
        
        
        %
                  
                else
                    a=a+1;
                end
    end
    if ismember(p,nonprime(:,1))
    else
        abspseudo(otherindexing)=p;
        otherindexing=otherindexing+1;
    end
    rangeindex=rangeindex+1;
end

new=size(nonprime,1);
i=1;
j=1;
while i<= new
    if nonprime(i,2)>1
        care(j,:)=nonprime(i,:);
        j=j+1;
    end
    i=i+1;
end
    
    

abspseudo
care
nonprime;
end

