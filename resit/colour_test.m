logical_mask = eye(3,3);
logical_mask = repmat(logical_mask,1,1,3);
colour = [0,1,0];

image = logical_mask.*colour;

imshow(image);

colours = ones(length(unique_values)+1,3);
colours(:,1) = linspace(0,1,length(unique_values)+1);
colours = hsv2rgb(colours);
colours = colours(1:end-1,:);