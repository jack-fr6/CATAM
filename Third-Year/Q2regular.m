function [outputArg1,outputArg2] = Q2regular(a,A)
i=1;
j=1;
B(1)=0;
k=size(A,2);
while j<=k;
    p=A(j);
    %Calculate a^{p-1}=t
        t=mod(a^(p-1),p)
    %Finished calculating a^{p-1}=t
    if t==1
        B(i)=p;
        i=i+1;
    else
    end
j=j+1;
end
B'



end

