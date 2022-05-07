function [outputArg1,outputArg2] = Bsmooth(N,B)
i=1;
k=zeros(size(B,2),2);
while i<= size(B,2)
    p=B(i);
    if mod(N,p)==0
        k(i)=k(i)+1;
        N=N/p;
    else
        i=i+1;
    end
end
i=1;
while i<= size(B,2)
NN=prod(B(i)^k(i));
i=i+1;
end
diff=N-NN;
if diff ==0
    disp(['N is B smooth'])
else
    disp(['N is not B smooth'])
end
    


end

