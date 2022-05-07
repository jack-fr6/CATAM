function [outputArg1,outputArg2] = F2Gauss(A)

length=size(A,1);
width=size(A,2);


i=1;
j=1;
while i<= length && j<= width

finish =0;

while  finish ==0

    if norm(A([i:length],j))==0
            j=j+1;
            if j> width
                finish=1;
            end
    else
                A(i,j);
            %Rearrange rows
                if A(i,j)== 1

                else

                    k=i+1;
                    fin=0;
                    while fin==0 && k<= length
                        if A(k,j) == 1
                            hold=A(i,:);
                            A(i,:)=A(k,:);
                            A(k,:)=hold;
                            fin=1;
                        else
                            k=k+1;
                        end
                    end
                end
                i;
                j;
                A;
                
                %subtract away bad rows
                
                k=i+1;
                while k<= length
                    
                    if A(k,j) == 0
                    else
                        A(k,:)=mod(A(k,:)-A(i,:),2);
                    end
                    k=k+1;
                end
                finish=1;
                A;
    end
end
i=i+1;
j=j+1;
end
A;
decided=zeros(width,1);        

if width <= length && A(width,width)==1
    disp(['Kernel is trivial'])
    v=zeros(width,1);
elseif norm(A)==0
    v=ones(width,1);
else
    v=zeros(width,1);
    %find first row not all zero
    term=0;
    i=length;
    while term==0
        if norm(A(i,:))==0
            i=i-1;
        else
            st=i;
            term=1;
        end
    end
    %sort out any relationship on first row
    i=st;
    
    while i >= 1
        j=1;
        term=0;
        while term ==0
            if A(i,j)==1
                term=1;
            else
                j=j+1;
            end
        end
         jj=j+1;
        while jj<= width
            if decided(jj)==0    
            v(jj)=1;
            decided(jj)=1;
            end
            jj=jj+1;
        end
        if j==width || norm(A(i,[j+1:width]))==0
            v(j)=0;
            decided(j)=1;
        else
            x=A(i,[j+1:width]).';
            y=v([j+1:width]);
            z=x.*y;
            v(j)=mod(-sum(z),2);
            decided(j)=1;
        end
        i=i-1;
 
    end
end
A
v
mod(A*v,2)
                
            

    
        



end

