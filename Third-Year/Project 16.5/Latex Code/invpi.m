function [outputArg1,outputArg2] = invpi(pi)
n=size(pi,1);

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
inv
    

end

