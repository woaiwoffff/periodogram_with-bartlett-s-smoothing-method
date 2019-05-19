clear all;
L=512; %Sample length for the random signal
mu=0;% 0 mean 
sigma=1;%standard veviation 1
% Wn:white guassin signal
Wn=sigma*randn(L,1)+mu;%random normal random 
a1=0.1;a2=0.1;a3=0.059;a4=0.031;
X=[];
X(1,1)=0;X(2,1)=0;X(3,1)=0;X(4,1)=0;
for i = 5:L

    X(i,1) =a1*X(i-1,1)+a2*X(i-2,1)+a3*X(i-3,1)+a4*X(i-4,1)+Wn(i,1);
               % X(i,1) =a1*X(i-1,1)+Wn(i,1);
end
L1=L/1;L2=L/2;L3=L/12;
[pow,freq]=periodogrambat(X,L1,1); %L:512
[pow1,freq1]=periodogrambat(X,L2,1); %L:256
[pow2,freq2]=periodogrambat(X,L3,1); %L:128
figure(1);
hold off;h1 = plot(freq,pow,'r')
hold on;h2 = plot(freq1,pow1,'g');
h3 = plot(freq2,pow2,'b')
string le1;
string le2;
string le3;
le1=sprintf('K=1, ,L=%d',L/1);
le2=sprintf('K=2, ,L=%d',L/2);
le3=sprintf('K=12, ,L=%d',L/8);
title('Peridogram of white gaussian process with 0 mean unit variance');
xlabel('Frequency(1/N)');
ylabel('Magnitude(dB)');
for f = 1:1:L;
%Hf(f)=1/(1-0.1*exp(-1i*2*pi*f/L));
   Hf(f)=1/(1-a1*exp(-1i*2*pi*f)-a2*exp(-1i*2*pi*f*2)-a3*exp(-1i*2*pi*f*3)-a4*exp(-1i*2*pi*f*4));
   %S(j)=abs(Hf(f)).^2*sigma*sigma;.
%SS(f)=1/(1+a1*a1-2*a1*cos(2*pi*f));
end
 S=abs(Hf).^2;
 freq = 0:1:L-1;
h4=plot(freq,20*log10(S))
grid on
string le4;
le4=sprintf('PSD Definition');
legend([h1,h2,h3,h4],le1,le2,le3,le4);