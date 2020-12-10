function [Cloud,Intensity]=SimulatedData(upper_bound_x,lower_bound_x,upper_bound_y,lower_bound_y,upper_noise_x,upper_noise_y,upper_depth,actual_points,noisy_points,start,intensity_actual,intensity_noise)


step_x=(upper_bound_x-lower_bound_x)/actual_points;
step_y=(upper_bound_x-lower_bound_x)/actual_points;
gv_x = lower_bound_x:step_x:upper_bound_x;
gv_y=lower_bound_y:step_y:upper_bound_y;
[X,Y] = meshgrid(gv_x,gv_y);

ptCloud= [X(:),Y(:),start*ones(numel(X),1)];

noise_x=upper_noise_x*rand(noisy_points,1);
noise_y=upper_noise_y*rand(noisy_points,1);
noise_z=upper_depth*rand(noisy_points,1);
noise=[noise_x,noise_y,noise_z];
Cloud=[ptCloud;noise];
Intensity=intensity_actual*ones(numel(X),1);

noiseIntens=intensity_noise*ones(size(noise,1),1);
Intensity=[Intensity;noiseIntens];
Cloud=Cloud';

end