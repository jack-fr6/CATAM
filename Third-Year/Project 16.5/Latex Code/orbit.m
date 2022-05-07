function [outputArg1,outputArg2] = orbit(A,el)

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
orbit


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
witness
        
        
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


                
                
                
                
        
        
       
    
    
    
    








end

