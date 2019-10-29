function res_angle = getBlaze(varargin)
%��ҫ��դ��λ�ֲ�
%   P = getBlaze(R, C, T, ori) ������ҫ��դ��λ�ֲ�ͼ
%   P = getBlaze([R C], T, ori) 
%   
%   R - ��������
%   C - ��������
%   T - ��ҫ��դ����
%   ori - ��ҫ����
%       - 'up'          ��
%       - 'down'        ��
%       - 'left'        ��
%       - 'right'       ��
%       - 'leftup'      ����
%       - 'leftdown'    ����
%       - 'rightup'     ����
%       - 'rightdown'   ����
%
%   P - ���ص���λ�ֲ�����
%
%   Author Information
%   -----------------------
%   Author : rlxu
%   Update Date : 2019-10-25
%
%   Copyright 2019 Key Laboratory of ICSP Anhui University

if nargin > 0
    [varargin{:}] = convertStringsToChars(varargin{:});
end

[Rows, Cols, T, ori] = parse_inputs(varargin{:});


switch ori
    case 'up',       x_axis =  1; y_axis =  0;
    case 'down',     x_axis = -1; y_axis =  0;
    case 'left',     x_axis =  0; y_axis =  1;
    case 'right',    x_axis =  0; y_axis = -1;
    case 'leftup',   x_axis =  1; y_axis =  1;
    case 'leftdown', x_axis = -1; y_axis =  1;
    case 'rightup',  x_axis =  1; y_axis = -1;
    case 'rightdown',x_axis = -1; y_axis = -1;
    otherwise,       x_axis =  0; y_axis =  0;
end
fi = zeros(Rows, Cols);
for r=1:Rows
    for c=1:Cols
        fi(r,c)=mod(x_axis*r+y_axis*c,T)*2*pi/T;%�õ���ҫ��դ�ı���ʽ
    end
end
res_angle = mod(fi,2*pi);

end




% Function parse_inputs
function [Rows, Cols, T, ori] = parse_inputs(varargin)

Rows = 0;
Cols = 0;
T = 0;
ori = '';

if (nargin < 3 || nargin > 4)
	error('����������������');
end


if (nargin == 3)
    Rows = varargin{1}(1,1);
    Cols = varargin{1}(1,2);
    T = varargin{2};
    ori = varargin{3};
end

if (nargin == 4)
    R = varargin{1};
    C = varargin{2};
    T = varargin{3};
    ori = varargin{4};
end



end