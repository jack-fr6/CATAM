function [outputArg1,outputArg2] = polgcd(a,b,p)
%finds the gcd of polynomials a,b (given in DocPolynom format) over the
%field F_p

a=DocPolynom(mod(double(a),p));
b=DocPolynom(mod(double(b),p));
va=double(a);
vb=double(b);
da=size(va,2);
db=size(vb,2);
%if da>db
   % holding=b;
    %b=a;
    %a=holding;
%end
a=DocPolynom(mod(double(a),p));
b=DocPolynom(mod(double(b),p));
va=double(a);
vb=double(b);
da=size(va,2);
db=size(vb,2);
    
    
index=0;
divalg=0;
while norm(vb) ~= 0
    T=b;
    a;
    b;
    % Run divisor algorithm
            n=DocPolynom(mod(double(a),p));
            d=DocPolynom(mod(double(b),p));
            n;
            d;


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


                dq=size(vq,2)-1;
                dr=size(vr,2)-1;
    
 


                q;
                r;
            end

    % Finished running divisor algorithm
    b=DocPolynom(mod(double(r),p));
    a=DocPolynom(mod(double(T),p));
    va=double(a);
    vb=double(b);
    da=size(va,2);
    db=size(vb,2);
end
a




end

