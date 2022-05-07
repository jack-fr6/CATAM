function [outputArg1,outputArg2] = Q4(range)
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
        a;
        p;
                greatestcommon = gcd(a,p);
                N=p;
                if gcd(p,2)==2;
                    if p==2
                        a=a+1;
                        terminatetest=1;
                    else
                        nonprime(indexing,:)=[p,a-1];
                        indexing=indexing+1;
                        terminatetest=1;
                    end
                elseif greatestcommon ==1
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

                   


                    %Finish test to see if Jacobi symbol = power
                    
        
        
        
        %
                    if Test ~= 0
                        nonprime(indexing,:)=[p,a-1];
                        indexing=indexing+1;
                        terminatetest=1;
                    else


                        a=a+1;
                    end
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
        careabout(j,:)=nonprime(i,:);
        j=j+1;
    end
    i=i+1;
end
    
    

abspseudo
careabout
nonprime;
end

