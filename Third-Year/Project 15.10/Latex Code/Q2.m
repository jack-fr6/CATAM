function [outputArg1,outputArg2] = Q2(max)
N=1;
squares=[1,4,9,16,25,36,49];
while N<=50
        clear x a r s 
        if ismembertol(N,squares)
            a=zeros(1,max);
            s=a;
            r=a;
            a(1)=sqrt(N);
            x=a;
        else
                    x(1)=sqrt(N);
                    a(1)=floor(x(1));
                    r(1)=0;
                    s(1)=1;

                    i=2;

                    while i<= max
                        r(i)=-(r(i-1)-(s(i-1)*a(i-1)));
                        s(i)=-(((r(i-1)^2-N)/s(i-1))-(2*r(i-1)*a(i-1))+(s(i-1)*(a(i-1)^2)));
                        x(i)=(r(i)+sqrt(N))/s(i);
                        a(i)=floor(x(i));
                        
                        i=i+1;
                    end
        end
        A(:,N)=a.';
        R(:,N)=r.';
        S(:,N)=s.';
        X(:,N)=x.';
        
                    
                    
        N=N+1;
end
A.';
R.'
S.'
    
    
    

end

