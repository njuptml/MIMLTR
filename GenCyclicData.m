function [x] = GenCyclicData(inner_radius,band_width,num_points)
rot_deg = rand(num_points,1)*2*pi;
% rot_deg = rand(num_points,1)*2*pi;
% 生成随机的角度
radius = inner_radius + band_width*rand(num_points,1);
% 生成随机的半径
x = [radius.*sin(rot_deg),radius.*cos(rot_deg)];%生成最终的二难数据
end

%调用：

