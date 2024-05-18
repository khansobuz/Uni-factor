function [gen1,imp1] = matching_IoM_bloom(bloom_filter)
gen1 = [];
gen2 = [];

for i = 1:100
  
  combination = nchoosek(1:5, 2);
   
    for j = 1:length(combination)
        file1 = combination(j,:);
       % maxoutfile1 = strcat(pwd, '/ori/', num2str(i), '_',num2str(file1(1)),'.mat');
      % maxoutfile1 = strcat(pwd, '/bloom_filter/', num2str(i), '_',num2str(file1(1)),'.mat');
       %load(maxoutfile1); 
      % template1 = bloom_code;
      template1=bloom_filter{i,file1(1)};
       % template1 = ori_code;
       % maxoutfile2 = strcat(pwd, '/ori/', num2str(i), '_',num2str(file1(2)),'.mat');
      % maxoutfile2 = strcat(pwd, '/bloom_filter/', num2str(i), '_',num2str(file1(2)),'.mat');
      % load(maxoutfile2);
      % template2 = bloom_code;
      template2=bloom_filter{i,file1(2)};
       % template2 = ori_code;
       
    intra_score=[];
  
        a111=template1;
        b111=template2;
        intra_score=sum(sum(xor(a111,b111)))/(sum(a111)+sum(b111));
        
%         t1=a111';
%         t2=b111';
%        C2=abs(t1 - t2);
% %     totalnumbm=size(template1,2);
%     
%       CC=find(C2==0);
%       totalnumbs=size(CC(),2);
%       intra_score(kkk)= totalnumbs/(length(t1)+length(t2)-totalnumbs);
     
    
 
    similiraty1=mean(intra_score); 
    
    
   % tmp_gen{1}=intra_score;
   % gen = [gen,tmp_gen];
    gen1 = [gen1; similiraty1];
%     gen2 = [gen2; similiraty2];
    end
end

imp1 = [];
imp2 = [];
%imp = {};
%tmp_imp={};
combination = nchoosek(1:100, 2);
for i = 1:length(combination)
   
    files = combination(i,:);
    for j=1:5
  
    template1=bloom_filter{files(1),j};
     for jj=1:5
  
    template2=bloom_filter{files(2),jj};
  
   inter_score=[];

        a111=template1;
        b111=template2;
        inter_score =sum(sum(xor(a111,b111)))/(sum(a111)+sum(b111));

       
  
    similiraty1=mean(inter_score);
%     similiraty2=sum(sum(xor(template1,template2)))/1024;
 
    imp1 = [imp1; similiraty1];
%     imp2 = [imp2; similiraty2];
     end
    end
end
