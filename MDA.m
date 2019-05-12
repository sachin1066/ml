clear;close all;clc
%urlwrite('https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data','data.csv')
x = xlsread('data.csv');
[a b ] = size(x);
y = x(:,1); 
x = x(:,2:b);
nc = length(unique(y));

sw = zeros(b-1,b-1);
sb = zeros(b-1,b-1);
m = mean(x,1);
for j = 1:nc
    l = 0;
    p = [];
    for i = 1:a
        if(y(i) == j)
            l = l+1;
            p(l,:) = x(i,:);
        end
    end
    sw = sw + cov(p)*(l-1);
    ml = mean(p,1);
    diff = ml - m;
    sb = sb + l*(diff)'*(diff);
end

csw = pinv(sw)*sb;
[coeff,val] = eig(csw);
val = diag(val);
cpp = coeff;
coeff = coeff(:,length(coeff):-1:1);
features = input('Enter features');
coeff = coeff(:,1:features);


reduced_dim =real( coeff' * x')';
 

for j = 1:nc
    l = 0;
    p = [];
    for i = 1:a
        if(y(i) == j)
            l = l+1;
            p(l,:) = x(i,:);
        end
    end
    reduced_dim =real( coeff' * p')';
    plot(reduced_dim(:,1),reduced_dim(:,2),'.')
    hold on;
end
hold off;
