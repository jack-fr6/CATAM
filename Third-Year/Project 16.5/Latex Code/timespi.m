function [outputArg1,outputArg2] = timespi(pia,pib)
n=size(pia,1);


i=1;

pipiab=zeros(n,1);

while i<= n
    pipiab(i)=pia(pib(i));
    i=i+1;
end
pipiab


end

