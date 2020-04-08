% %定义初始数据传送带拉力F
% %传送带拉力F  N
% %传送带速度v  m/s
% %滚动直径D    m
% F = 5550; v = 1.06 ; D = 0.65
%run(yuanshishuju)

%------------------------------
%计算传送带功率Pw   Kw
Pw = (F*v)/1000 ;
fprintf('电传送带功率Pw为%d Kw\n',Pw)
%电机所需功率 Pd    Kw
Pd = Pw/eta;
fprintf('总效率因素eta为%d \n',eta)
fprintf('电动机带功率Pd为%d Kw\n',Pd)


%------------------------------
%电动机额定功率 Ped KW
Ped = KA*Pd;
fprintf('额定电动机功率为%d KW (KA为%d）\n',Ped,KA)
%转速nw
nw = (v*60)/(pi*D);
fprintf('滚筒转速nw为%d r/min \n',nw)
%传动比为 i 8~60
imax = nw*60;
imin = nw*8;
fprintf('电动机同步转速为 %d ~%d  r/min  (i=8~60) \n',imin,imax)
fprintf('综合考虑，选择电动机型号为？？？？？Y180L-8 \n')
nm = 970;%电动机满载转速
fprintf('该电动机的参数为%d r/min \n ',nm)

%------------------------------
%总传动比i
i=nm/nw;
fprintf('总传动比i：%d \n',i)
%分配V带传动比i0 和齿轮传动比i1、i2
i0 = 1;
i1=6.3;
i2=3.55;
fprintf('V带传动比i0为%d \n 齿轮传动比i1为 %d 、i2为 %d \n')

%------------------------------
%计算各轴输入功率
    %电机功率 Pd
    %减速器高速轴（轴1）的功率 P1
    %减速器低速轴（轴2）的功率 P2 (要不要算联轴器？？？）
    %输出轴功率P3
P1 = Pd*eta1*eta3*eta3*eta2;
P2 = P1*eta2*eta3;
P3 = P2*eta4*etaw;
fprintf('高速轴的功率P1=%d KW \n 低速轴的功率P2=%d KW \n',P1,P2)
%计算各转速
    %电机轴转速nm
    %高速轴的转速n1= nm/i1
    %低速轴的转速n2= n1/i2
n1 = nm/i1;
n2 = n1/i2;
fprintf('高速轴的转速n1=%d r/min \n 低速轴的转速n2=%d r/min \n',n1,n2)

%------------------------------
%各轴的扭矩
    %电动机扭矩Td N*m
    %高速轴扭矩T1 N*m
    %低速轴扭矩T2 N*m
Td = 9550*Pd/nm;
T1 = 9550*P1/n1;
T2 = 9550*P2/n2;
fprintf('电动机扭矩Td = %dN*m \n 高速轴扭矩T1 = %d N*m\n 低速轴扭矩T2 = %dN*m \n',Td,T1,T2)



