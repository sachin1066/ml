clear;close all;clc;
load ionosphere;
X(:,2) = [];
m = mean(X,1);
c = cov(X);
[coeff,val] = eig(c);
coeff = coeff(:,length(coeff):-1:1);
features = input('Enter features');
coeff = coeff(:,1:features);
mm = [];
for i=1:length(X)
    mm(i,:) = m(1,:);
end

reduced_dim =( coeff' * (X - mm)')';

x1= [];
x2=[];
i1=0;
i2=0;
mm1=[];
mm2=[];

class = unique(Y);
for i = 1:length(Y)
    if(strcmp(Y(i),class(1)))
        i1 = i1+1;
        x1(i1,:) = X(i,:);
        mm1(i1,:) = m(1,:);
    end
    if(strcmp(Y(i),class(2)))
        i2 = i2+1;
        x2(i2,:) = X(i,:);
        mm2(i2,:) = m(1,:);
    end
end

d1 =( coeff' * (x1 - mm1)')';
d2 =( coeff' * (x2 - mm2)')';
plot(d1(:,1),d1(:,2),'.') 
hold on 
plot(d2(:,1),d2(:,2),'.') 
hold off