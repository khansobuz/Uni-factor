function [W_P,B_P]=matching_score(Dis,Dist,nn)
W_P=[];
B_P=[];
Dis=Dis;
Dist=Dist;
%nn=0.01;
for i=0:nn:1
    n=0;m=0;
   
   W_d=sum(Dist>i&Dist<i+nn);
   B_d=sum(Dis>i&Dis<i+nn);

   W_persent=W_d/size(Dist,2);
   B_persent=B_d/size(Dis,2);
   
   W_P=[W_P W_persent];
   B_P=[B_P B_persent];
end

x=0:nn:1;

%figure(1)
%plot(x,W_P*100,'b--',x,B_P*100,'k');
%xlabel('Distance');
%ylabel('Percentage(%) ');
%legend('Genuine','Imposter');