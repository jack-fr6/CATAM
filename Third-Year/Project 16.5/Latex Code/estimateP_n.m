function [outputArg1,outputArg2] = estimateP_n(range)
rangeindex=1;
maximumsizeofrange=size(range,2);
while rangeindex<= maximumsizeofrange
    n=range(rangeindex);
nnnn=1;
prob=0;
oldGsize=0;
newGsize=0;
while nnnn<= 10000
    G=zeros(n,1);
    %Generate G_(:,1)
    i=2;
    G(1,1)=randi(n);
    
    while i<= n
        x=randi(n);
        if ismembertol(x,G([1:i-1],1))
        else
            G(i,1)=x;
            i=i+1;
        end
    end
    
    %Generated G(:,1)
    
    %Generate G_(:,1)
    i=2;
    G(1,2)=randi(n);
    
    while i<= n
        x=randi(n);
        if ismembertol(x,G([1:i-1],2))
        else
            G(i,2)=x;
            i=i+1;
        end
    end
    
    %Generated G(:,1)
    
    
    

    G;
    nn=1;
    clear oldGsize newGsize

    
    %run perm group size program
                oldGsize(1)=size(G,2);
                iii=1;
                
                nn(iii)=1;
                nontrivorb=0;


                while nontrivorb == 0


                %Step 1: Reduce generators of G
                            clear Pi
                            Pi=G;
                            %Run stripping algorithm
                                k=size(Pi,2);

                                n=size(Pi,1);

                                l=1;

                                A=zeros(n,n);

                                while l <= k

                                    r=1;
                                    finish=0;

                                    while finish == 0

                                        if r~=n

                                            if Pi(r,l) ~= r
                                                    Pi;
                                                if A(r,Pi(r,l)) == 0

                                                    A(r,Pi(r,l))=l;
                                                    finish=1;

                                                else

                                                    pi=Pi(:,A(r,Pi(r,l)));
                                                    %"run invert pi"
                                                        i=1;

                                                            inv=zeros(n,1);
                                                            while i<= n
                                                                term=0;
                                                                j=1;
                                                                while term == 0

                                                                if pi(j)==i;
                                                                    inv(i)=j;
                                                                    term=1;
                                                                else
                                                                    j=j+1;
                                                                end
                                                                end
                                                                i=i+1;
                                                            end


                                                    pia=inv;
                                                    pib=Pi(:,l);
                                                    %"run multiply pia,pib program"

                                                        i=1;

                                                        pipiab=zeros(n,1);

                                                        while i<= n
                                                            pipiab(i)=pia(pib(i));
                                                            i=i+1;
                                                        end
                                                       Pi(:,l)= pipiab;


                                                    %Ran multiply pia,pib program
                                                    r=r+1;

                                                end

                                            else

                                                r=r+1;

                                            end

                                        else

                                            finish = 1;

                                        end

                                    end
                                    l=l+1;

                                end
                                A;
                                i=1;
                                kk=1;
                                Qi=zeros(n,1);
                                while i<= size(A,1)
                                    j=1;
                                    while j<= size(A,2)
                                        if A(i,j) ~= 0
                                        Qi(:, kk)=Pi(:,A(i,j));
                                        kk=kk+1;
                                        else
                                        end
                                        j=j+1;
                                    end
                                    i=i+1;
                                end
                                Pi=Qi;
                                G=Pi;


                    newGsize(iii)=size(G,2);
                    %call reduced generators G too

                    if G(1,1)==0
                        nontrivorb=1;
                    end

                    if nontrivorb==0

                %Step 2: Find non-trivial orbits of G

                    pi=G(:,1);
                    i=1;
                    foundel=0;
                    while foundel==0

                        if pi(i)==i
                            i=i+1;
                        else
                        foundel=1;
                        a=i;
                        end
                    end




                            %Step 3: Find orbit of a

                                    %Run stabiliser program

                                        Y=G;
                                        y=size(Y,2);

                                            A=Y;
                                            el=a;
                                            %Run orbit algorithm;

                                                        k=size(A,2);
                                                        n=size(A,1);
                                                        orbit=[el,0];
                                                        newsize=1;
                                                        oldsize=0;

                                                        while oldsize < newsize 



                                                            i=oldsize+1;
                                                            oldsize=size(orbit,1);
                                                            c=1;

                                                            while i <= oldsize 

                                                                j=1;
                                                                while j<= k
                                                                  j;

                                                                    if ismembertol(A(orbit(i,1),j),orbit(:,1))

                                                                    else
                                                                        orbit;
                                                                        holdvec=[orbit(i,:),j];
                                                                        orbit(:,size(orbit,2)+1)=zeros(size(orbit,1),1);
                                                                        orbit(oldsize+c,:)=holdvec;
                                                                        orbit(oldsize+c,1)=A(orbit(i,1),j);
                                                                        c=c+1;
                                                                    end
                                                                    j=j+1;
                                                                end
                                                                i=i+1;
                                                            end
                                                        newsize=size(orbit,1);
                                                        end
                                                        orbit;


                                                        %Calculate table of witnesses
                                                        xx=size(orbit,2);
                                                        orbsize=size(orbit,1);
                                                        i=2;
                                                        witness=[1:n].';
                                                        B=zeros(size(A,1),size(A,2)+1);
                                                        B(:,1)=[1:n];
                                                        B(:,[2:size(A,2)+1])=A;

                                                        while i<=orbsize

                                                            j=2;
                                                            witness(:,i)=B(:,1);
                                                            while j<= xx
                                                                %"do witness(:,i)=B(:,j+1)*witness(:,i)

                                                                pia=B(:,orbit(i,j)+1);
                                                                pib=witness(:,i);
                                                                pipiab=zeros(n,1);
                                                                ii=1;

                                                                    while ii<= n
                                                                        pipiab(ii)=pia(pib(ii));
                                                                        ii=ii+1;
                                                                    end
                                                                    witness(:,i)=pipiab;
                                                                j=j+1;
                                                            end
                                                            i=i+1;
                                                        end
                                                        witness;





                                            %Ran orbit program
                                            t=size(orbit,1);
                                            T=witness;

                                            %Find inverse of orbit
                                                %pi=orbit(:,1)
                                                %"Run invpi program



                                                %i=1;

                                                %inv=zeros(n,1);
                                                %while i<= n
                                                   % term=0;
                                                    %j=1;
                                                   % while term == 0

                                                   % if pi(j)==i;
                                                      %  inv(i)=j;
                                                       % term=1;
                                                  %  else
                                                     %   j=j+1;
                                                   % end
                                                  %  end
                                                  %  i=i+1;
                                               % end



                                               % inverseorbit=inv;
                                            %Found inverse orbit




                                             yi=1;


                                             stab=zeros(n,1);

                                             while yi <= y

                                                ti=1;

                                                while ti<= t


                                                    %Calculate Y(:,yi)*T(:,ti)

                                                        pia=Y(:,yi);
                                                        pib=T(:,ti);

                                                        %"Run timespi program"

                                                            i=1;

                                                            pipiab=zeros(n,1);

                                                            while i<= n
                                                                pipiab(i)=pia(pib(i));
                                                                i=i+1;
                                                            end



                                                    %Calculate varphi(piapib)

                                                        ne=pipiab(a);
                                                        i=1;
                                                        foundinverse=0;
                                                        while foundinverse==0
                                                            if orbit(i,1)==ne
                                                                nu=i;
                                                                foundinverse=1;
                                                            else
                                                                i=i+1;
                                                            end
                                                        end



                                                        varphi=T(:,nu);

                                                    %Calculate inverse of varphi

                                                        pi=varphi;

                                                        %"run invpi program "

                                                        i=1;

                                                        inv=zeros(n,1);
                                                        while i<= n
                                                            term=0;
                                                            j=1;
                                                            while term == 0

                                                            if pi(j)==i
                                                                inv(i)=j;
                                                                term=1;
                                                            else
                                                                j=j+1;
                                                            end
                                                            end
                                                            i=i+1;
                                                        end


                                                    %Calculate stab

                                                        pia=inv;
                                                        pib=pipiab;

                                                        %"Run timespi program"

                                                                i=1;

                                                                pipiab=zeros(n,1);

                                                                while i<= n
                                                                    pipiab(i)=pia(pib(i));
                                                                    i=i+1;
                                                                end



                                                        stab(:,(yi-1)*y+ti)=pipiab;




                                                    ti=ti+1;
                                                end
                                                yi=yi+1;
                                             end

                                            stab;



                            %Found orbit of a



                                nn(iii)=size(orbit,1);



                            G=stab;
                            
                            %remove 0 cols of G
                            i=1;
                            width=size(G,2);

                            while i<= width
                                if norm(G(:,i))==0
                                    G=G(:,[[1:i-1],[i+1:width]]);
                                    width=width-1;
                                else
                                    i=i+1;
                                end
                                
                            end
                            G;
                            oldGsize(iii+1)=size(G,2);

                            %DONT REDUCE GENERATORS OF G yet
                        else
                        end
                        iii=iii+1;
                end
                nn;
                pgroupsize=prod(nn);
                pgroupsize;
    
    
    
    
    
    %ran perm group size program
    
    if pgroupsize == factorial(n)
        prob=prob+1;
    end
    nnnn=nnnn+1;
end
P_n=prob/10000;
P_n;
probvec(rangeindex)=P_n;
rangeindex=rangeindex+1;
end
probvec
    





end

