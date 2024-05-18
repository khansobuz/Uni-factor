function [gen1] = matching_IoM_bloom_pseudo(bloom_filter)
gen1 = [];
gen2 = [];
  combination = nchoosek(1:10, 2);  
    for j = 1:length(combination)
        file1 = combination(j,:);     
      template1=bloom_filter{file1(1)};      
      template2=bloom_filter{file1(2)};       
    intra_score=[];
    for kkk=1:16
        a111=template1(:,kkk);
        b111=template2(:,kkk);
        intra_score(kkk) =sum(sum(xor(a111,b111)))/(sum(a111)+sum(b111));
       

    end
    similiraty1=mean(intra_score); 
%     similiraty2=sum(sum(xor(template1,template2)))/n;
    
   % tmp_gen{1}=intra_score;
   % gen = [gen,tmp_gen];
    gen1 = [gen1; similiraty1];
%     gen2 = [gen2; similiraty2];
    end
end
