function [trn , trnGroup , labels , testing2] = initialize_ATT_EXP6(counter, XP, YP, path_of_eye_aligned_faces, crop_faces_row1, crop_faces_row2, crop_faces_column1, crop_faces_column2)

 trn = [];
 testing2 = [];
 %load('C:\Users\IHC\Desktop\openFace\ASM_warp_2')
 
 for i=1:40
     
     for j=counter: min(counter+5,10)
        reader = imread([path_of_eye_aligned_faces int2str((i-1)*10+j) '.jpg']);
        %reader = reader(75:170, 115:215);  % just take the cropped face (and not white background)! +++++++++++++++++++++++++++++
        
        randValue = rand;
        change = 1;
%         if (randValue>0.75)
%             reader = circshift(reader,[change,0]);
%         end
%         if (randValue<0.75 && randValue>0.5)
%             reader = circshift(reader,[0,change]);
%         end
%         if (randValue<0.5 && randValue>0.25)
%             reader = circshift(reader,[0,(-1)*change]);
%         end
%         if (randValue<0.25)
%             reader = circshift(reader,[(-1)*change,0]);
%         end
        
        vector = reshape(reader,1,[]);
        vector = double(vector);
        trn = [trn;vector];
     end
     for j=1:counter+5-10
        reader = imread([path_of_eye_aligned_faces int2str((i-1)*10+j) '.jpg']);
        %reader = reader(75:170, 115:215);  % just take the cropped face (and not white background)! +++++++++++++++++++++++++++++
        
        randValue = rand;
        change = 1;
%         if (randValue>0.75)
%             reader = circshift(reader,[change,0]);
%         end
%         if (randValue<0.75 && randValue>0.5)
%             reader = circshift(reader,[0,change]);
%         end
%         if (randValue<0.5 && randValue>0.25)
%             reader = circshift(reader,[0,(-1)*change]);
%         end
%         if (randValue<0.25)
%             reader = circshift(reader,[(-1)*change,0]);
%         end
        
        vector = reshape(reader,1,[]);
        vector = double(vector);
        trn = [trn;vector];
     end
     
     for k = counter+6:min(counter+9,10)
         reader = imread([path_of_eye_aligned_faces int2str((i-1)*10+k) '.jpg']);
         %reader = reader(75:170, 115:215);  % just take the cropped face (and not white background)! +++++++++++++++++++++++++++++
         
        vector = reshape(reader,1,[]);
        vector = double(vector);
        testing2 = [testing2;vector];
     end
     
     
     
     for k = max(1,counter+6-10):counter+9-10
         reader = imread([path_of_eye_aligned_faces int2str((i-1)*10+k) '.jpg']);
         %reader = reader(75:170, 115:215);  % just take the cropped face (and not white background)! +++++++++++++++++++++++++++++
         
        vector = reshape(reader,1,[]);
        vector = double(vector);
        testing2 = [testing2;vector];
     end
     
 end

 for i=1:size(trn,2)
    MEAN_train(i) = mean(trn(:,i));
    NORM_train(i) = norm(trn(:,i));
    trn(:,i) = trn(:,i) - MEAN_train(i);
    trn(:,i) = trn(:,i) / NORM_train(i);
 end
  
  for i=1:size(testing2,2)
    testing2(:,i) = testing2(:,i) - MEAN_train(i);
    testing2(:,i) = testing2(:,i) / NORM_train(i);
  end
 
  
trnGroup = zeros(1,240);
for i=1:40
    for j=1:6
        trnGroup(1,(i-1)*6+j)=i;
    end
end


labels = zeros(160,240);
for i = 1:40
    for j = 4*i - 3:4*i
        for k = 6*i - 5:6*i
            labels(j,k)=1;
        end
    end
end
