clear all;
L=512; %Sample length for the random signal
mu=0;% 0 mean 
sigma=1;%standard veviation 1
% Wn:white guassin signal
Wn=sigma*randn(L,1)+mu;%random normal random 
thea1=-pi+2*pi*rand(L,1);
thea2=-pi+2*pi*rand(L,1);
a1=2;
a2=1;

 X=[];
 
for i = 1:L

    X(end+1,:) =a1* cos(i*0.3*pi+thea1(i))+a2*cos(i*0.33*pi+thea2(i))+Wn(i);
                
end

L1=L/1;
L2=L/2;
L3=L/4;

[pow,freq]=periodogrambat(X,L1,1); %L:512
[pow1,freq1]=periodogrambat(X,L2,1); %L:256
[pow2,freq2]=periodogrambat(X,L3,1); %L:128

figure(1);

%plot Setting
hold off;
h1 = plot(freq,pow,'r')
hold on;
%figure(2);
h2 = plot(freq1,pow1,'g');
%figure(3);
h3 = plot(freq2,pow2,'b')
string le1;
string le2;
string le3;
le1=sprintf('K=%d, ,L=%d',L/L1,L1);
le2=sprintf('K=%d, ,L=%d',L/L2,L2);
le3=sprintf('K=%d, ,L=%d',L/L3,L3);
title('Peridogram of white gaussian process with 0 mean unit variance');
legend([h1,h2,h3],le1,le2,le3);
xlabel('Frequency(1/N)');
ylabel('Magnitude(dB)');