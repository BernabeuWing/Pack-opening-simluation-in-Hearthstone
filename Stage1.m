A=0;
k=0;
W=0;
A1=0;
A2=0;
A3=0;
A4=0;
A5=0;
A6=0;
R=zeros(211,1); % a row of cards

 for i=1: 10000
     W=stage1(); 
     A=A+W;
     if W>=240 && W <= 450
           R(W-239)= R(W-239)+1;
  end  
 end
 
 for i=1: 61
    A1=A1+R(i);
 end
 for i=1: 86
    A2=A2+R(i);
 end
 for i=1: 111
    A3=A3+R(i);
 end
 for i=1: 136
    A4=A4+R(i);
 end
 for i=1: 161
    A5=A5+R(i);
 end
 for i=1: 186
    A6=A6+R(i);
 end
 x=linspace(240,450,211);
plot(x,R,'k*')
xline(floor(A/10000))
sum(R)
Answer = [ floor(A/10000), A1/100 ,A2/100,A3/100,A4/100,A5/100,A6/100]


function [k] = stage1()
  T=zeros(135,1); % a row of cards
id1=0; % indicator for legendary
id2=0; % indicator for epic
id3=0; % indicator for rare
id4=0; % indicator for common



  S=0; % number of cards collected
C=0; % number of dust collected from extra cards
N=1; % number of dust needed

n=0;%  counter  
while S< 135 && C < N 
C=0; 
N=0; 
S=0;

  r=randi([1 10000]);
  n=n+0.2;
  if n==10
            id1= randi([1 25]);
            T(id1)=T(id1)+1;
  end  
  if floor(n)==n && r> 2816
            r=randi([1 2816]);
  end  
  if r<= 101
            id1=randi([1 25]);
            T(id1)=T(id1)+1;
  end      
  if 102<= r && r<=529
           id2=randi([26 49]);
            T(id2)=T(id2)+1;
  end
  if 530<= r && r<=2816
            id3=randi([50 84]);
            T(id3)=T(id3)+1;
  end
  if 2817< r
       id4=randi([85 135]);
      T(id4)=T(id4)+1;
   end
  
 
  for i=1: 135
         if i <= 25 && T(i) >0
            S=S+1;
        end
        if i >=26  && T(i) >1
            S=S+1;
        end % count number of  cards  collected
  end
  for i=1: 135
        if i <= 25 && T(i) >1
            C=C+400* (T(i)-1);
        end
        if i >=26 && i <=49 && T(i) >2
            C=C+100* (T(i)-2);
        end
            
        if i >=50  && i <=84 && T(i) >2
            C=C+20* (T(i)-2);
        end
        if i >84 && T(i) >2
            C=C+5* (T(i)-2);
        end % dust collected
  end
    for i=1: 135
        if i <= 25 && T(i) ==0
            N=N+1600;
        end
        if i > 25 && i <=49 && T(i) <2
            N=N+400*(2-T(i));
        end
            
        if i >50  && i <=84 && T(i) <2
            N=N+100*(2-T(i));
        end
        if i >84 && T(i) <2
            N=N+40*(2-T(i));
        end %  dust needed
    end
  k=floor(n);
end
end
