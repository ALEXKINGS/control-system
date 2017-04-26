%/*************************************************************************************
% *  File Name                                :   Oscillational_Element.m
% 
% *  Create Date                             :    2017/04/25
% *  Author/Corporation                :   Twsa
% *  Description                              :   mechanical control engineering:
%                                                         The frequency characteristics of typical 
%                                                         Bode Diagram And Nyquist  Diagram of Oscillational_Element  

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
zeta=[0.1,0.2,0.3,0.4,0.5,0.7,1];
% T=[10,100,1000];                               %set constant param of intertial element
T=1;

%calculate every params of open loop about this system
K=1;
A1=T*T;
A2=2*zeta*T;
A3=1;
%build the transfer function of open loop
nG1=[K];                        %transfer function's numerator
len=size(zeta);
den_len=3;
dG1=[zeros(len(2),den_len)];   %len(2):num of transfer function need to sim

% transfer module Initialize
G1=[zeros(1,len(2))];

for t=1:1:len(2)
    dG1(t,:)=[A1,A2(t),A3];     %transfer function's thedenominator
    G1=tf(nG1,dG1(t,:));    %make transfer module
end

%from the operations ,I can find the transfer function is Intergral-Element
%function

%Set Bode Diagram params
%at this time,I have to draw the transfer function nyquist diagram
figure(1); 
title('Nyquist Diagram:Oscillational element');
xlabel('real part ');
ylabel('imaginary part');
%Complete Setting

for t=1:1:len(2)
    axis([-3,5,-5,3]);                                    %sets scaling for the x- and y-axeson the current plot
    grid on;
    %function I use:nyquist(num,den)£»
    [re1,im1]=nyquist(nG1,dG1(t,:));
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
        case 4,
            plot(re1,im1,'c','LineWidth',1);              %paint nyquist
            hold on
        case 5,
            plot(re1,im1,'m','LineWidth',1);              %paint nyquist
            hold on
        case 6,
            plot(re1,im1,'y','LineWidth',1);              %paint nyquist
            hold on
        case 7,
            plot(re1,im1,'k','LineWidth',1);              %paint nyquist
            hold on
        otherwise,
            disp('The value is out of range. ');
    end
end
legend('zeta=0.1','zeta=0.2','zeta=0.3','zeta=0.4','zeta=0.5','zeta=0.7','zeta=1');
hold off;

%Set Bode Diagram params
%Add Bode diagram to Oscillational-Element
w=logspace(-5,3,1000);                        %in the space of logarithm,define frequency w
figure(2);
%Complete Setting

for t=1:1:len(2)
    grid on;
    bode(nG1,dG1(t,:),w);                       %paint Bode diagram
    legend('zeta=0.1','zeta=0.2','zeta=0.3','zeta=0.4','zeta=0.5','zeta=0.7','zeta=1');
    hold on;
end
hold off;

