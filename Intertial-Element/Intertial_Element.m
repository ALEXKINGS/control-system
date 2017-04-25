%/*************************************************************************************
% *  File Name                               :   Intertial_Element.m
% 
% *  Create Date                             :    2017/04/25
% *  Author/Corporation                :   Twsa
% *  Description                              :   mechanical control engineering:
%                                                         The frequency characteristics of typical 
%                                                         Bode Diagram And Nyquist  Diagram of Intertial_Element  

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
T=[10,100,1000];                               %set constant param of intertial element
Ka=1;
Aa=T;
Ab=1;
Ac=0;
%calculate every params of open loop about this system
K=Ka;
A1=Aa;
A2=Ab;
A3=Ac;
%build the transfer function of open loop
nG1=[K];                        %transfer function's numerator
len=size(T);
den_len=2;
dG1=[zeros(len(2),den_len)];    %len(2):num of transfer function need to sim

% transfer module Initialize
G1=[zeros(1,len(2))];

for t=1:1:len(2)
    dG1(t,:)=[A1(t),A2];     %transfer function's thedenominator
    G1=tf(nG1,dG1(t,:))    %make transfer module
end

%from the operations ,I can find the transfer function is Intergral-Element
%function

%Set Bode Diagram params
%at this time,I have to draw the transfer function nyquist diagram
figure(1); 
title('Nyquist Diagram:Intertial element');
xlabel('real part ');
ylabel('imaginary part');
%Complete Setting

for t=1:1:len(2)
    axis([0,2,-1,1]);                                    %sets scaling for the x- and y-axeson the current plot
    grid on;
    %function I use:nyquist(num,den)£»
    [re1,im1]=nyquist(nG1,dG1(t,:));
    if t==1
      plot(re1,im1,'r','LineWidth',1);                    %paint nyquist
      hold on;
    elseif t==2
        plot(re1,im1,'go','LineWidth',1);              %paint nyquist
        hold on
    elseif t==3
        plot(re1,im1,'b*','LineWidth',1);              %paint nyquist
        hold on
    end
end
legend('nyquist 1','nyquist 2','nyquist 3');
hold off;

%Set Bode Diagram params
%Add Bode diagram to Intertial-Element
w=logspace(-5,3,1000);                %in the space of logarithm,define frequency w
figure(2);
%Complete Setting

for t=1:1:len(2)
    grid on;
    bode(nG1,dG1(t,:),w);                       %paint Bode diagram
    legend('bode 1','bode 2','bode 3');
    hold on;
end

