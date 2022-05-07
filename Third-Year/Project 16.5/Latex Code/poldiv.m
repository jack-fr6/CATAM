function [Division] = poldiv(n,d,p)
%Divides polynomial n by polynomial d modulo p
%Note this program makes use of the DocPolynom package and polynomials
%should be given in the DocPolynom form

n=DocPolynom(mod(double(n),p));
d=DocPolynom(mod(double(d),p));



zero=DocPolynom([0]);
q=zero;
r=n;
vd=double(d);
vq=double(q);
vr= double(r);

dd=size(vd,2)-1;
dr=size(vr,2)-1;
j=1;


while norm(vr) ~= 0 && dd<=dr
    lr=vr(1);
    ld=vd(1);
    a=ld;
        C=0;
        i=1;
        while i <= p-1 && C==0
            if mod(a*i,p)==1
                ldinv=i;
                C=1;
            else
            end
            i=i+1;
        end
        dr;
        dd;
    t=zeros(1,dr-dd+1);
    t(1)=(mod(lr*ldinv,p));
    t=DocPolynom(t);
    t;
    q=plus(q,t);
    r=minus(r,mtimes(t,d));
    q=DocPolynom(mod(double(q),p));
    r=DocPolynom(mod(double(r),p));

    vq=double(q);
    vr= double(r);
    r;
    norm(vr);
    dd;
    dr;
    vr;

    dq=size(vq,2)-1;
    dr=size(vr,2)-1;
    
 

end

    q
    d
    r
    DocPolynom(mod(double(plus(r,mtimes(q,d))),p))
    
    
    
    
    



end

