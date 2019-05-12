clear all;

pr=zeros(1,20);
l=10;
for k=1:20
    pr(k)=(l^k*exp(-l))/factorial(k);
 
end
plot(1:20,pr,'or')