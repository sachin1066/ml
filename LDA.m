clear;close all;clc;
load ionosphere;
class = unique(Y);
X(:,2) = [];

i1=0;
i2=0;
x1 = [];
x2 = [];
for i = 1:length(Y)
    if(strcmp(Y(i),class(1)))
        i1 = i1+1;
        x1(i1,:) = X(i,:);
    end
    if(strcmp(Y(i),class(2)))
        i2 = i2+1;
        x2(i2,:) = X(i,:);
    end
end

m1 = mean(x1,1);
m2 = mean(x2,1);
c1 = cov(x1);
c2 = cov(x2);

scatter = c1 *(i1-1) + c2*(i2-1);

w = pinv(scatter)* (m1-m2)';

reduced = (w' * X')';
r1 = (w' * x1')';
r2 = (w' * x2')';


plot(r1,15,'.')
hold on 
plot(r2,20,'.')
hold off
axis([-.05  .05 10 25])
hold off
