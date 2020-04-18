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
if (5.5<Pd)&&(11>Pd) %选择功率
    Pd = 7.5;
else
    fprintf('错误 \n')
end
fprintf('总效率因素eta为%d \n',eta)
fprintf('电动机带功率Pd为%d Kw\n',Pd)


%------------------------------
%{2020.4.17注：
%这里需不需要乘KA不确定，网上以及一些设计书没有乘，所以这个不作为哦选点击的标准}
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
fprintf('综合考虑，选择电动机型号为？？？？？Y160M-6 \n')
nm = 970;%电动机满载转速
fprintf('该电动机的参数为 %d r/min \n ',nm)

%------------------------------
%总传动比im,然后认为近似取为i
im=nm/nw;
i = 31.15;
fprintf('总传动比i：%d \n',i)
%分配V带传动比i0 和齿轮传动比i1、i2
i0 =2.492 ;
i1=4;
i2=3.125;
fprintf('V带传动比i0为 %d \n 齿轮传动比i1为 %d 、i2为 %d \n',i0,i1,i2)

%------------------------------
%计算各轴输入功率
    %电机功率 Pd
    %减速器高速轴（轴1）的功率 P1 经过V带
    %减速器中速轴（轴2）的功率 P2 
    %减速器低速轴（轴2）的功率 P3
    %输出轴功率P4
    %传送带的功率Pw
Pd;
P1 = Pd*eta1;
P2 = P1*eta2*eta3;
P3 = P2*eta2*eta3;
P4 = P3*eta4*eta3;
Pw = P4*etaw;
fprintf('电动机0轴的功率P0= %d KW \n高速轴的功率P1= %d KW \n 中速轴的功率P2= %d KW \n 低速轴的功率P3= %d KW \n 输出轴的功率P4= %d KW \n 传送带的功率Pw= %d KW \n',Pd,P1,P2,P3,P4,Pw)
%计算各转速
    %电机轴转速n0
    %高速轴的转速n1= nm/i1
    %中速轴的转速n2= n1/i2
    %低速轴的转速n3= n1/i2
    %带轮轴的转速n4= n2/1
n0=nm;
n1 = n0/i0;
n2= n1/i1;
n3 = n2/i2;
n4 = n3/1;
fprintf('电动机轴转速n0=%d r/min \n 高速轴的转速n1=%d r/min \n 中速轴的转速n2=%d r/min \n 低速轴的转速n3=%d r/min \n 带轮轴的转速n4=%d r/min \n',n0,n1,n2,n3,n4)

%------------------------------
%各轴的扭矩
    %电动机扭矩Td N*m
    %高速轴扭矩T1 N*m
    %中速轴扭矩T2 N*m
    %低速轴扭矩T3 N*m
    %带轮轴扭矩T4 N*m
Td = 9550*Pd/nm;
T1 = 9550*P1/n1;
T2 = 9550*P2/n2;
T3 = 9550*P3/n3;
T4 = 9550*P4/n4;
fprintf('电动机扭矩Td = %dN*m \n 高速轴扭矩T1 = %d N*m\n 中速轴扭矩T2 = %dN*m \n 低速轴扭矩T3 = %dN*m \n 滚轴扭矩T4 = %dN*m \n',Td,T1,T2,T3,T4)



