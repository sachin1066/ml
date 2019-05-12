p = 3 + (3+3)*rand(1,500);
pr=zeros(1,500);
l=0.5;
for i=1:500
    pr(i)=l*exp(-l*p(i));
 
end
plot(p,pr,'.')