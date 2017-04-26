%/*************************************************************************************
% *  File Name                                :   First_derivativel_Element.m
% 
% *  Create Date                             :    2017/04/25
% *  Author/Corporation                :   Twsa
% *  Description                              :   mechanical control engineering:
%                                                         The frequency characteristics of typical 
%                                                         Bode Diagram And Nyquist  Diagram of First_derivativel_Element  

% *  Return Code                           :    None
% 
% *  Global Variable                       :    None
% *  File Static Variable                  :    None
% *  Function Static Variable         :    None
% 																			 
% *--------------------------------Revision History--------------------------------------
% *  No         Version         Date        RevisedBy        Item         Description  
% *  1          V1.0           2017/04/2    Twsa                 None           None
% 
% **************************************************************************************

%Set struct params of system
%zeta=[0.1,0.2,0.3,0.4,0.5,0.7,1];
T=[10,100,1000];                               %set constant param of intertial element
% T=1;

%calculate every params of open loop about this system
K1=T;
K2=1;
A1=0;
A2=0;
A3=1;
%build the transfer function of open loop
len=size(T);
den_len=2;
nG1=zeros(len(2),den_len)            %transfer function's numerator
dG1=[A1,A2,A3];   

% transfer module Initialize
G1=[zeros(1,len(2))]

for t=1:1:len(2)
    nG1(t,:)=[K1(t),K2]       %transfer function's thedenominator
    G1=tf(nG1(t,:),dG1);    %make transfer module
end

%from the operations ,I can find the transfer function is Intergral-Element
%function

%Set Bode Diagram params
%at this time,I have to draw the transfer function nyquist diagram
figure(1); 
title('Nyquist Diagram:First_derivativel element');
xlabel('real part ');
ylabel('imaginary part');
%Complete Setting

for t=1:1:len(2)
    axis([-3,5,-5,3]);                                    %sets scaling for the x- and y-axeson the current plot
    grid on;
    %function I use:nyquist(num,den)£»
    [re1,im1]=nyquist(nG1(t,:),dG1);
    switch(t)
        case 1,
            plot(re1,im1,'b','LineWidth',1);                    %paint nyquist
            hold on; 
        case 2,
            plot(re1,im1,'g','LineWidth',1);                    %paint nyquist
            hold on;
        case 3,
            plot(re1,im1,'r','LineWidth',1);              %paint nyquist
            hold on
        otherwise,
            disp('The value is out of range. ');
    end
end
legend('T=10','T=100','T=1000');
hold off;

%Set Bode Diagram params
%Add Bode diagram to First_derivativel-Element
w=logspace(-5,3,1000);                        %in the space of logarithm,define frequency w
figure(2);
%Complete Setting

for t=1:1:len(2)
    grid on;
    bode(nG1(t,:),dG1,w);                       %paint Bode diagram
    legend('T=10','T=100','T=1000');
    hold on;
end
hold off;

