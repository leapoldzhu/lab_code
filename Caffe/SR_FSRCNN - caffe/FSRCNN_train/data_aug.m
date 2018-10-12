clear; 
%% To do data augmentation
folder = 'Train/General-100';
savepath = 'Train/General-100-aug/';

filepaths = dir(fullfile(folder,'*.bmp'));
     
for i = 1 : length(filepaths)
    filename = filepaths(i).name;
    [add, im_name, type] = fileparts(filepaths(i).name);
    image = imread(fullfile(folder, filename));
    
    % different angle 4 types and origin scale
    for angle = 0: 90 :270
        im_rot = rot90(image, angle);
        imwrite(im_rot, [savepath im_name, '_rot' num2str(angle) '.bmp']);
        
        % different scale 4 types
        for scale = 0.6 : 0.1 :0.9
            im_down = imresize(im_rot, scale, 'bicubic');
            imwrite(im_down, [savepath im_name, '_rot' num2str(angle) '_s' num2str(scale*10) '.bmp']);
        end
        
    end
end
