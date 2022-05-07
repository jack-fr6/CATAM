function [outputArg1,outputArg2] = stripping(Pi)

%input(pi_1,pi_2, ... ,pi_k) 
%Going to have to change input to a matrix with each collumn being a generator 

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
Pi;
A

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

end

