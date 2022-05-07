function [outputArg1,outputArg2] = decompcalc4(f)
%Calcualtes decomposition group of f from primes 2 to 97


%Preparation
       primes=[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97];
      % primes=[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563, 569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 631, 641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 701, 709, 719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797, 809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883, 887, 907, 911, 919, 929, 937, 941, 947, 953, 967, 971, 977, 983, 991, 997];
 
       
       %primes=ones(1,25);
       %primes=5*primes;
        pindex=1;		
		holdf=f;
		vholdf = double(holdf);
		dholdf = size(vholdf,2)-1;
		G_pf=zeros(size(primes,2), dholdf );
		Group=zeros(size(primes,2),1);
        
        
while pindex <= size(primes,2)
    cou=1;
    %Setup
        p=primes(pindex);
		vf=mod(double(holdf),p);
		f=DocPolynom(vf);
		df=size(vf,2)-1;
        
    %Check if (f,Df)=1
        
        

 
        

	
	

		%Step 1: Checking if (f,f')=1
		
				%Calculate f'=Df
					
					vDf=zeros(1,df);
				    i=1;
				    while i<= df
				    	vDf(i)= (df-i+1)*vf(i);
				    	i=i+1;
				    end
				    
				    Df=DocPolynom(vDf);
				%Calculated Df
				
				
				%Run gcd program on (f,Df)
					
					a=f;
					b=Df;
				
				
						%finds the gcd of polynomials a,b (given in DocPolynom format) over the
                        %field F_p

                            a=DocPolynom(mod(double(a),p));
                            b=DocPolynom(mod(double(b),p));
                            va=double(a);
                            vb=double(b);
                            da=size(va,2);
                            db=size(vb,2);
                            if da<db
                                holding=a;
                                a=b;
                                b=holding;
                            end
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
                                % Run divisor algorithm
                                        n=DocPolynom(mod(double(a),p));
                                        d=DocPolynom(mod(double(b),p));



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
                                            ae=ld;
                                                C=0;
                                                i=1;
                                                while i <= p-1 && C==0
                                                    if mod(ae*i,p)==1
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


                                            divalg=divalg+1;
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

						
						
					gcd=a;
				
				%Ran gcd program
				
				
				%Check if gcd(f,Df)=1
					vgcd=double(gcd);
             
    
    if size(vgcd,2)==1
						
        %For each rr compute n_rr
        
                %Calculating f_rr
					
					v=f;
					w=DocPolynom([1 0]);
					rr=1;
					dv=df;
                    
                    
                    
                    while 2*rr <= dv
                        
                        
                        
                        %efficient program to calculate x^p^rr
                         bin=dec2bin(p^rr);
                        sizebin=size(bin,2);
                        powerindex=2;
                        if str2num(bin(sizebin)) == 1
                            nn=DocPolynom([1 0]);
                        else
                            nn=DocPolynom([ 1]);
                        end
                        
                        nn_i=DocPolynom([1 0]);
                        while powerindex <= sizebin;
                            nn_i=nn_i^2;
                            n=nn_i;
                            d=v;
                                %run divisor algorithm with n=nn_i, d=v
                                
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
                                    
                                    
                                    

                                %ran divisor algorithm and let nn_i=r
                                nn_i=r;
                            if str2num(bin(sizebin-powerindex+1)) ==1
                                    nn=mtimes(nn,nn_i);
                                    n=nn;
                                    d=v;
                                    
                                    %run divisor algorithm with n=nn and
                                    %d=v
                                    
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
                                                
                                    
                                    %rand divisor algorithm and let nn=r
                                    nn=r;
                            end
                            powerindex=powerindex+1;
                        end
                        nn=DocPolynom(mod(double(nn),p));
                        w=nn;
                       
                        %end of efficient program to calculate w^p
                        n=nn;
                        d=v;
                        
                        %Run divisor algorithm
                        
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


                                dq=size(vq,2)-1;
                                dr=size(vr,2)-1;



                            end
                        
                        
                        %Once ran divisor algorithm let w=r
                        
                        w=r;
                        
                        
                        
                        
                        
                        
                        vw=double(w);
                        dw=size(vw,2)-1;
                        
                        
                        %Run GCD program on w-x and v
                            a=minus(w,DocPolynom([1 0]));
                            b=v;
                            
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
                            
                        %Once ran GCD program let g=gcd
                        g=a;
                        w;
                        v;
                        g;
                        rr;
                        
                        vg=double(g);
                        dg=size(vg,2)-1;
                        if dg ~= 0
                            
                            g;
                            rr;
                            G_pf(pindex,rr)= dg/rr;
                            
                            n=v;
                            d=g;
                            %Run divisor algorithm
                            
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


                                    dq=size(vq,2)-1;
                                    dr=size(vr,2)-1;



                                end
                            
                            %Once ran divisor algorithm let v=q
                            v=q;
                            vv=double(v);
                            dv=size(vv,2)-1;
                            
                            %cut the rest out
                            
                            
                            %end of cutting out
                            
                        end
                        rr=rr+1;
                    end
                    
                    if dv ~= 0
                        
                        v;
                        dv;
                        G_pf(pindex,dv)=1;
                        
                    end
                    
                            
                            
                                    
                               
                        
                    
                    
					
					
                        
        
        
        
        
        
        

    else
        G_pf(pindex,:)=(-1)*ones(1,dholdf);
    end 

    %Calculate size of group
    
        
        if G_pf(pindex,1) == -1
			Group(pindex,1)=-1;
		else
			i=1;
			N=zeros(1,df);
			while i <= df
			
				if G_pf(pindex,i)==0 
				
					N(i)=1;
					
				else
					N(i)=i;
                    
                end
            i=i+1;
            end
            N;
            x=lcm(sym(N));
			Group(pindex,1)=x;
			 
        end

  pindex=pindex+1;
end
G_pf
Group
end