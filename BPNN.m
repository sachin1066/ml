clc;
load fisheriris;
meas;

totaldata1=zeros(150,4);
totaldata1=meas;
testset1=ones(45,5);
trainset1=zeros(105,4);
augm=ones(105,6);
%%%%%%CLASS1%%%%%%%
r=randperm(50);
for i=1:35
    
    trainset1(i,:)=totaldata1(r(i),:);
    
end
for i=1:15
    for j=1:4
   testset1(i,j)=totaldata1(r(i+35),j);
    end
    %testset1(i,5)=1;
  
    
end

%%%%%%CLASS2%%%%%%%
  r=randperm(50)+50;
for i=1:35
    trainset1(i+35,:)=totaldata1(r(i),:);
    
end
for i=1:15
    for j=1:4
   testset1(i+15,j)=totaldata1(r(i+35),j);
    end
   % testset1(i+15,5)=2;
  
    
end
%%%%%%CLASS3%%%%%%%
 r=randperm(50)+100;
for i=1:35
    trainset1(i+70,:)=totaldata1(r(i),:);
    
end
for i=1:15
    for j=1:4
   testset1(i+30,j)=totaldata1(r(i+35),j);
    end
    %testset1(i+30,5)=3;
  
    
end
%%%%%%%%%AUGUMENTED%%%%%%%%%
for i=1:105
    if(i<36)
    for j=1:4
        augm(i,j)=trainset1(i,j);
        
    end
    augm(i,6)=1;
    end
    if(35<i && i<70)
    for j=1:4
        augm(i,j)=trainset1(i,j);
        
    end
    augm(i,6)=2;
    end 
    if(70<i && i<106)
    for j=1:4
        augm(i,j)=trainset1(i,j);
        
    end
    augm(i,6)=3;
    end
end

w1=rand(5,10);
w2=rand(10,3);
a1=zeros(10,1);
a2=zeros(3,1);
t1=[1;0;0];
t2=[0;1;0];
t3=[0;0;1];
%flag=1;
e=[0;0;0];
%th=0.1;
cre=0;
eta=0.001;
f=zeros(10,10);


q=1;

while q<2
    d=randperm(105);
for i=1:105
    a1=logsig(w1'*augm(d(i),[1 2 3 4 5])');
    a2=logsig(w2'*a1);
         if(augm(d(i),[6])==1)
          e=t1-a2;
          cre=(e'*e)/2;
         end
         if(augm(d(i),[6])==2)
             e=t2-a2;
              cre=(e'*e)/2;
         end
         if(augm(d(i),[6])==3)
             e=t3-a2;
              cre=(e'*e)/2;
         end

            
            s2 =  -2*(1-a2).*a2.*e;
            w2 = w2-(eta*s2*a1')';
            for j=1:10
                f(j,j) = a1(j);
            end
            s1 = f*w2*s2;
            w1 = w1-(eta*s1*augm(d(i),[1 2 3 4 5]))';
end
q=q+1;
end
w1
w2
count=0;
for k=1:45
    a1 = logsig( w1'*testset1(k,:)' );
        a2 = logsig( w2'*a1 );
    class=find(a2 == max(a2(:)));
    if (k<16 && class==1)
        
        count=count+1;
    end
    if (15<k&&k<31&& class==2)
        
        count=count+1;
    end
    if (30<k&&k<46 && class==3)
        
        count=count+1;
    end
end
acc=(count/45)*100
