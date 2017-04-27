%/*************************************************************************************
% *  File Name                                :   Demo_4_3.m
% 
% *  Create Date                             :    2017/04/26
% *  Author/Corporation                :   Twsa 
% *  Description                              :   mechanical control engineering:
%                                                         The frequency characteristics of typical 
%                                                         Bode Diagram And Nyquist  Diagram  

% *  Return Code                           :    None
% 
% *  Global Variable                       :    None
% *  File Static Variable                  :    None
% *  Function Static Variable         :    None
% 																			 
% *--------------------------------Revision History--------------------------------------
% *  No         Version         Date        RevisedBy        Item         Description  
% *  1          V1.0           2017/04/26    Twsa                 None           None
% 
% **************************************************************************************

%clear params
clear;

%�趨ϵͳ�Ľṹ����
Ks=0.5; 
Ka=50; 
KT=0.6;
Kb=0.5;
La=0.02;
Ra=0.5;
J=0.05;
B=0.1;

%����ϵͳ�������ݺ����ĸ�������

K1=Ks*Ka*KT;
K2=Ra*B+KT*Kb;
K=K1/K2;
A1=(La*J)/K2;
A2=(La*B+Ra*J)/K2;

%����ϵͳ�Ŀ������ݺ���
nG1=[K];                              %���ô��ݺ����ķ���K
dG1=[A1,A2,1,0];                %���ô��ݺ����ķ�ĸ
G1=tf(nG1,dG1);
%2)  ����nyquist(num,den)����������ʵ�����鲿��
%      ������ϵͳ�Ŀ�������ͼ���鿴�Ƿ��Χ(-1,j0)��
%3)����Bode(num,den,w),����ϵͳ�Ŀ������ݲ���ͼ��
%    ������Ӧ��ԣ�Ⱥͷ�ֵ�������ж�ϵͳ�Ƿ��ȶ�

[re1,im1]=nyquist(nG1,dG1);
nyquist_array=[re1,im1];
nyquist_array_first_row=nyquist_array(:,1);
nyquist_array_second_row=nyquist_array(:,2);
ny_len=size(nyquist_array);

%x I need get
coordinate_Ineed=[-3.2345,0];
t=1;
str1=num2str(coordinate_Ineed(1));
while t<ny_len(1)
    str2=num2str(nyquist_array_first_row(t,1));
    if  strcmp(str1,str2)==1
%         t
        coordinate_Ineed=[coordinate_Ineed(1),nyquist_array_second_row(t,1)];
        break;
    end
     t=t+1;
end

figure(1);
plot(re1,im1,'r');                           %��������ͼ
title('Nyquist Diagram');
xlabel('real part ');
ylabel('imaginary part');
axis([-5,0.5,-15,1]);                       %�������귶Χ
grid on;

str1=num2str(coordinate_Ineed(1));
str2=num2str(coordinate_Ineed(2));
coordinate_tmp=['$ (',str1,' , ',str2,')'];
text(coordinate_Ineed(1),coordinate_Ineed(2),coordinate_tmp);
print(gcf,'-r300','-dpdf','figure(1).pdf');
w=logspace(0,3,1000);                %�ڶ����ռ䶨��Ƶ��
figure(2);

%on the bode diagram I need find some coordinates
[magout,phase,w] =bode(nG1,dG1,w);
bode(nG1,dG1,w);
bode_len=size(magout);
bode_params=zeros(bode_len(1),3);
bode_params(:,1)=magout;
bode_params(:,2)=phase;
bode_params(:,3)=w;                %frequency in the logspace of 

coordinate_Ineed=[0.920138029,0,0];
t=1;
str1=num2str(coordinate_Ineed(1));
while t<bode_len(1)
    str2=num2str(magout(t,1));
    if  strcmp(str1,str2)==1
%         t
        coordinate_Ineed=[coordinate_Ineed(1),phase(t,1),w(t,1)];
        break;
    end
     t=t+1;
end

str1=num2str(coordinate_Ineed(3)); 
str2= num2str(coordinate_Ineed(1));
coordinate_tmp=['$ (',str1,' , ',str2,')'];
text(coordinate_Ineed(3),coordinate_Ineed(1)+50,coordinate_tmp);

str1=num2str(coordinate_Ineed(3)); 
str2= num2str(coordinate_Ineed(2));
coordinate_tmp=['$ (',str1,' , ',str2,')'];
text(coordinate_Ineed(3),coordinate_Ineed(2),coordinate_tmp);
%���Ʋ���ͼ

coordinate_Ineed=[0,-180.226566,0];
t=1;
str1=num2str(coordinate_Ineed(2));
while t<bode_len(1)
    str2=num2str(phase(t,1));
    if  strcmp(str1,str2)==1
%         t
        coordinate_Ineed=[magout(t,1),coordinate_Ineed(2),w(t,1)]
        break;
    end
     t=t+1;
end
str1=num2str(coordinate_Ineed(3)); 
str2= num2str(coordinate_Ineed(1));
coordinate_tmp=['$ (',str1,' , ',str2,')']
text(coordinate_Ineed(3),coordinate_Ineed(1)+60,coordinate_tmp);

str1=num2str(coordinate_Ineed(3)); 
str2= num2str(coordinate_Ineed(2));
coordinate_tmp=['$ (',str1,' , ',str2,')']
text(coordinate_Ineed(3),coordinate_Ineed(2),coordinate_tmp);
%���Ʋ���ͼ
hold on;
grid on;
print(gcf,'-r300','-dpdf','figure(2).pdf');

%��������Ҫ��ʹ���У��װ�õ����У��װ����У��װ�õ�������5.4�ں�5.6�ڵ�����
%3������У�����ϵͳ����ͼ�����������Ҫ�����޸�װ�õĲ���������¼������Ĳ���

K= [1,5,10];                        %������̬���Ҫ�󣬼��㿪������
%build the transfer function of open loop
len=size(K);
den_len=1;

 %Initialize transfer function's numerator
nG1=zeros(len(2),den_len);
 %Initialize transfer function's thedenominator
dG1=[A1,A2,1,0];                
% Initialize transfer module 
G1=[zeros(1,len(2))];

%configure params of the transfer function and assemble
for t=1:1:len(2)
    nG1(t,:)=K(t)                               %transfer function's thedenominator
    G1=tf(nG1(t,:),dG1);                    %make transfer module
end

%configure figure(3) and add curve to it 
figure(3);              
for t=1:1:len(2)
    grid on;
    bode(nG1(t,:),dG1,w);                      %paint Bode diagram
    hold on;
end
hold off;
legend('T=0','T=5','T=10');
% The End of figure(3) ,haven't correction for it ,and why not now��
%Do it!
print(gcf,'-r300','-dpdf','figure(3).pdf');

% but at first,I have to confirm some params which is some characterics that need
% to implement
fi=   10;                   %Ҫ�����λ��ǰ��  I custom,i have no mind to  catch it
alf=(1+sin(fi*3.14/180))/(1-sin(fi*3.14/180));
                              %�ͺ�У������1��
wc=  10;                 %δУ��֮ǰ����λ������ԽƵ�ʣ���figure  3���ҳ���

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
jiaozheng_w1=wc/alf;          %�ͺ󲿷ֵ�ת��Ƶ�xԶ��wc
jiaozheng_w2=jiaozheng_w1/alf; %�ͺ󲿷ֵ�ת��Ƶ�x
jiaozheng_t1=1/jiaozheng_w1;   
jiaozheng_t2=1/jiaozheng_w2;
w2= 0.5;
w3= 2;
jiaozheng_t3=1/w2;             %��ǰ���ڵ�ת��Ƶ��w2(���Ƽ���õ�)
jiaozheng_t4=1/w3;             %��ǰ���ڵ�ת��Ƶ��w3(���Ƽ���õ�)

e1=conv([jiaozheng_t1,1],[jiaozheng_t3,1]);
e2=conv([jiaozheng_t2,1],[jiaozheng_t4,1]);

% len=size(K);
% den_len=1;
%Initialize transfer function's numerator
den_len=3;      %0��ϵͳ���Ϊ����ϵͳ
nG2=zeros(len(2),den_len);
 %Initialize transfer function's thedenominator
dG2=conv(dG1,e2);            %after adjusting, thedenominator ,the adjusting factor is e2   
% Initialize transfer module 
G2=[zeros(1,len(2))];

%configure params of the transfer function and assemble
for t=1:1:len(2)
    nG2(t,:)=conv(nG1(t,:),e1);                              %transfer function's thedenominator
    G2=tf(nG2(t,:),dG2)                                    %make transfer module
end

%At last,need to paint the Bode diagrams of the transfer function
%that we have add some adjusting params;

%first step:configure some params of figure(4)
%paint figure(4):
figure(4);
%in the space of logarithm,define frequency w
w=logspace(-2,3,1000);      

for t=1:1:len(2)
    grid on;
    %on the bode diagram I need find some coordinates
    bode(nG2(t,:),dG2,w);               %У����ϵͳ�Ĳ���
   
    if t==3
         [magout,phase,w] =bode(nG2(t,:),dG2,w);
        bode_len=size(magout);
        bode1_params=zeros(bode_len(1),3);
        bode1_params(:,1)=magout;
        bode1_params(:,2)=phase;
        bode1_params(:,3)=w;                %frequency in the logspace of 
        coordinate_Ineed=[0,-180.522674,0];
        
        t1=1;
        str1=num2str(coordinate_Ineed(2));
        while t1<bode_len(1)
            str2=num2str(phase(t1,1));
            if  strcmp(str1,str2)==1
        %         t1
                coordinate_Ineed=[magout(t1,1),coordinate_Ineed(2),w(t1,1)]
                break;
            end
             t1=t1+1;
        end
        str1=num2str(coordinate_Ineed(3)); 
        str2= num2str(coordinate_Ineed(1));
        coordinate_tmp=['$ (',str1,' , ',str2,')'];
        text(coordinate_Ineed(3),coordinate_Ineed(1)+220,coordinate_tmp);

        str1=num2str(coordinate_Ineed(3)); 
        str2= num2str(coordinate_Ineed(2));
        coordinate_tmp=['$ (',str1,' , ',str2,')'];
        text(coordinate_Ineed(3),coordinate_Ineed(2),coordinate_tmp);
            hold on;
    end
      hold on;
end
legend('T=0','T=5','T=10');
hold off;
print(gcf,'-r300','-dpdf','figure(4).pdf');
