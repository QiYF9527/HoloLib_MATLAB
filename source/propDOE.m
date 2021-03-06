function U = propDOE(data, z, Lw, Lh, width, height, lambda)
%DOE元件传播，返回振幅图像
%   U = propDOE(P, z, Lw, Lh, width, height, lambda)
%   P - 相位图
%   z - 衍射平面到观察平面距离，单位：米
%   Lw - 图像宽度，单位：米
%   Lh - 图像高度，单位：米
%   lambda - 入射光波长，单位：米
%
%   U - 返回平面复振幅分布
%

w = linspace(-Lw/2, Lw/2, width); 
h = linspace(-Lh/2, Lh/2, height);
[X, Y] = meshgrid(w, h);
Rsamp = sqrt(X.^2+Y.^2);
PPF = pi / (lambda*z).*Rsamp.*Rsamp;
H = mod(data+PPF, 2*pi);
U = ifft2(exp(1j*H));

end