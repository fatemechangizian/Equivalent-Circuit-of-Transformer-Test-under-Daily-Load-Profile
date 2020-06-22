             
clc
clear all

S=input('APPARENT POWER:')
Vh=input('HIGH VOLTAGE:')
Vl=input('LOW VOLTAGE:')
f=50

%open circuit test

Voc=input('open circuit voltage:')
Ioc=input('open circuit current:')
Poc=input('open circuit core power:')

%short cicuit test

Vsc=input('short circuit voltage:')
Isc=input('short circuit current:')
Psc=input('short circuit copper power:')

syms answer
if Voc==Vh
    answer=1
    disp('o.c test is in HV side and in rated voltage')
elseif abs(Voc-Vh)<=50
    answer=10
    disp('o.c test is in HV side and not in rated voltage')
elseif Voc==Vl
    answer=2
    disp('o.c test is in LV side and in rated voltage')
else %abs(Voc-Vl)<=50
    answer=20
    disp('o.c test is in LV side and not in rated voltage')
end

syms answ
%compute nominal current
Inh=S/Vh
Inl=S/Vl
floor(Inh)
if Inh==Isc
    disp('s.c test is in HV side and in rated cuurent')
    answ=3
end
if floor(Inh)==floor(Isc) & Inh~=Isc
    disp('s.c test is in HV side and  not in rated cuurent')
   answ=4
end
if Inl==Isc
        disp('s.c test is in LV side and in rated cuurent')
    answ=5
end
if floor(Inl)==floor(Isc) & Inl~=Isc
    disp('s.c test is in LV side and  not in rated cuurent')
   answ=6
end
%suppose that it's step-up trans
a=(Vh/Vl)
 
%compute Rc,Xm
Rc=(Voc^2)/Poc;
Ic=Voc/Rc;
Im=sqrt((Ioc^2)-(Ic^2));
Xm=Voc/Im;
Lm=Xm/(2*pi*f);

if answer==1 || answer==10
    disp('Rc,Xm is in HV side')
else
    disp('Rc,Xm was in LV side we compute it for HV side')
    Rc=Rc*(a^2)
    Lm=Lm*(a^2)
end

%compute Req,Xeq
%R1 res. for HV side
%R2 res. for LV side

Req=Psc/Isc^2
Zsc=Vsc/Isc;
Xeq=sqrt((Zsc^2)-(Req^2))
if answ==3 || answ==4
    disp('Req,Xeq was in HV side')
    R1=Req/2
    X1=Xeq/2;
    L1=X1/(2*pi*f)
    R2=(Req/2)/(a^2)
    X2=(Xeq/2)/(a^2);
    L2=X2/(2*pi*f)
    
else
    disp('Req,Xeq was in LV side')
    R2=Req/2
    X2=Xeq/2;
    L2=X2/(2*pi*f)
    R1=(Req/2)*(a^2)
    X1=(Xeq/2)*(a^2);
    L1=X1/(2*pi*f)
end

% Pcore rated
if answer==1 || answer==2
    Pcrated=Poc
    disp('core power is rated')
end
if answer==10 
    Pcrated=((Voc/Vh)^2)*Poc
end
if answer==20
    Pcrated=((Voc/Vl)^2)*Poc
end


%Pcu rated
if answ==3 || answ==5
  Pcurated=Psc
    disp('cu power is rated')
end
if answ==4
 Pcurated=((Isc/Inh)^2)*Psc
end
if answ==6
 Pcurated=((Isc/Inl)^2)*Psc
end

    

