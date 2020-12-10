clc;clear;

%Simulated data parameters.
start=10;
step_depth=0.5;
upper_depth=100;
upper_bound_x=2;
lower_bound_x=0;
upper_bound_y=4;
lower_bound_y=0;
upper_noise_x=4;
upper_noise_y=10;
actual_points=10;
noisy_points=50;
intensity_actual=600;
intensity_noise=100;

%Number of simulations
steps=100;

%Algorithm specifications
k=8;
thres=0.3;

%color specifications
color=[1 0 0];

% writerObj = VideoWriter('filtered_data','MPEG-4'); % Name it.
% writerObj.FrameRate = 10; % How many frames per second.
% open(writerObj); 

for i=1:steps 
[Cloud,Intensity]= SimulatedData(upper_bound_x,lower_bound_x,upper_bound_y,lower_bound_y,upper_noise_x,upper_noise_y,upper_depth,actual_points,noisy_points,start,intensity_actual,intensity_noise);
% [Cloud,Intensity]=discard(Cloud,k,thres,Intensity);
fraction=Intensity./max(Intensity);
scatter3(Cloud(1,:),Cloud(3,:),Cloud(2,:),[],color.*fraction,'filled');hold on;
axis([-4 4 0 100 -10 10])
view(5,5)
% frame = getframe(gcf); 
% writeVideo(writerObj, frame);   
close 
start=start+step_depth;
end
% close(writerObj);
