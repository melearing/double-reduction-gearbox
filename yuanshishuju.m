%-----------
%�˽ű�����ԭʼ����
%�����������������ٶȡ���Ͳֱ��
%������Ч��etaѡ��
%-----------

%���ʹ�����F  N
F = 5550
%���ʹ��ٶ�v  m/s
v = 1.06 
%����ֱ��D    m
D = 0.65
%Ч������ eta
    %V������Ч�� eta1  ��Ŀ�涨 1��
    eta1 = 0.96;
    %���ִ���Ч�� eta2 8������ ����
    eta2 = 0.97;
    %��д���Ч�� eta3 ������� 4��
    eta3 = 0.99;
    %����������Ч�� eta4 ���������� 1��
    eta4 = 0.99;
    %��ͲЧ�� etaw 1��
    etaw = 0.94;
 %��Ч�� eta
 eta = (eta1*eta2*eta2*eta3*eta3*eta3*eta3*eta4*etaw);
 fprintf('��Ч������etaΪ%d \n',eta)
 %��綯������ϵ�� KA
 KA = 1.3
 %����Բ��б����