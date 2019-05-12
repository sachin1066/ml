clear all;
d=2;

s=[1,0;0,1]
m=[0,0];
meanvec=transpose(m)

i=1;

px=zeros(2,500);
while i<=500
    x = -3 + (3+3)*rand(1,1);
y = -3 + (3+3)*rand(1,1);
z=([x;y]);

    px1=(1/(((2*pi)^(d/2))*det(s)^(1/2)))*exp(-(1/2)*transpose(z(:,1)-meanvec)*(inv(s))*(z(:,1)-meanvec));
    
    if (px1 >rand())
       px(:,i)=z;
       i=i+1;
        
        
    end
    
    
end
px(1,:)


plot(px(1,:),px(2,:),'*')
axis([-7 7 -7 7])








    