function [outputArg1,outputArg2] = Q1(AA)
AA=N;
BBB(1)=0;
iii=1;
jjj=1;
while jjj <= size(AA,2)
    nnn=2;
    ttt=0;
    while nnn<= sqrt(AA(jjj))
        if gcd(nnn,AA(jjj))==nnn
            ttt=ttt+1;
        else
        end
        nnn=nnn+1;
    end
        if ttt==0
            BBB(iii)=AA(jjj);
            iii=iii+1;
        else
        end
 jjj=jjj+1;       
    end
BBB'
end

