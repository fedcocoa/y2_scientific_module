%Rohan Dewan C1946553
%
%Make sure to zoom out on the figure to make sure all root circle markers
%show up

syms x;

%% choosing each function
% input_function = @(x) x^16 -1;
% df_function = @(x) 16*x^15;

input_function = @(x) x.^3 -1;
df_function = @(x) 3.*x.^2;

% input_function = @(x) x^7 -1;
% df_function = @(x) 7*x^6;

tolerance = 1e-5;
unique_tolerance = 1e-3;


%% Create input matrix
resolution = 400;
x = linspace(-1,1,resolution);
y = transpose(linspace(-1,1,resolution)*1i);
input_matrix = x+y;

roots = zeros(resolution,resolution);
iterations = zeros(resolution,resolution);


%% Run NewtonMod on input matrix
for x = 1:resolution
    for y = 1:resolution
        answer = NewtonMod(input_function,df_function,input_matrix(x,y),tolerance,10);
        roots(x,y) = answer(1);
        iterations(x,y) = answer(2);
    end
end

%% Checking which values converged
mask = ~isnan(roots);
all_roots = roots.*mask;
isnan_roots = all_roots(~isnan(all_roots));

%% find unique roots
flat_roots = [real(isnan_roots),imag(isnan_roots)];
unique_values = uniquetol(flat_roots,unique_tolerance,'ByRows',true);
unique_values = unique_values(:,1) + unique_values(:,2)*1i;

%% generate colours for the roots
%Generating in the HSV space and then converting to RGB
colours = ones(length(unique_values)+1,3);
colours(:,1) = linspace(0,1,length(unique_values)+1);
colours = hsv2rgb(colours);
colours = colours(1:end-1,:);
colourmap = zeros(resolution,resolution,3);

%% creating colour image
flat_uniques = [real(unique_values),imag(unique_values)];
flat_allroots = reshape(all_roots,[],1);
flat_allroots = [real(flat_allroots),imag(flat_allroots)];

mid_gray = [.5,.5,.5];

for i = 1:length(flat_uniques)
    flat_colour = ismembertol(flat_allroots,flat_uniques(i,:),unique_tolerance,'ByRows',true);
    coloured_root = flat_colour.*colours(i,:);
    current_colour = reshape(coloured_root,resolution,resolution,3);
    colourmap = colourmap + current_colour;
end

grey_area = colourmap(:,:,1) == 0 & colourmap(:,:,2) == 0 & colourmap(:,:,3) == 0;
grey_area = repmat(grey_area,1,1,3);
grey_area = reshape(grey_area,[],3);
grey_area = grey_area.*mid_gray;
grey_area = reshape(grey_area,resolution,resolution,3);

colourmap = colourmap + grey_area;


%% creating iteration image and final image

iterations = rescale(iterations);
final_image = (colourmap+iterations)/2;

%% plot
%adding the circle annotations to the roots
circles = [(real(unique_values)+1)*200,(imag(unique_values)+1)*200];

% subplot(2,2,1);
% imshow(colourmap);
% subplot(2,2,2);
% imshow(iterations);
% subplot(2,2,3);
h = imshow(final_image);
axes = gca;
hold on;
plot(axes,circles(:,1)+1,circles(:,2),'o','MarkerSize',10,'MarkerFaceColor','black','MarkerEdgeColor','white');
hold off;
