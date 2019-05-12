r = 3 + (6-3)*rand(1,500);
pr=zeros(1,500);
for i=1:500
    pr(i)=1/(6-3);
end
plot(r,pr,'.')