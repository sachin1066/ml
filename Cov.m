n=3;
%x=round(rand(n,n)*100)
x=[1,2,3;4,5,6;7,8,9]
t=0;
meanvec=zeros(1,n);


   meanvec=mean(x,1)


b1=zeros(n,n)
for i=1:n

b1=b1+transpose(x(i,:)-meanvec)*(x(i,:)-meanvec);
end
b1;
b1/(n-1)