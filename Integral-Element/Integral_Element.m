%/*************************************************************************************
% *  File Name                               :    Intergral_Element.m
% 
% *  Create Date                             :    2017/04/25
% *  Author/Corporation                :   Twsa
% *  Description                              :   mechanical control engineering:
%                                                         The frequency characteristics of typical 
%                                                         Bode Diagram And Nyquist  Diagram of Integral_Element  

% *  Return Code                           :    None
% 
% *  Global Variable                       :    None
% *  File Static Variable                  :    None
% *  Function Static Variable              :    None
% 																			 
% *--------------------------------Revision History--------------------------------------
% *  No         Version         Date        RevisedBy        Item         Description  
% *  1          V1.0           2017/04/2 Twsa                 None           None
% 
% **************************************************************************************

%Set struct params of system
K=1;
A1=1;
A2=0;
%calculate every params of open loop about this system
%None

%build the transfer function of open loop
nG1=[K];                         %transfer function's numerator
dG1=[A1,A2];                  %transfer function's thedenominator
G1=tf(nG1,dG1)              %make transfer module
%from the operations ,I can find the transfer function is Intergral-Element
%function

%at this time,I have to draw the transfer function nyquist diagram
%function I use:nyquist(num,den)£»
[re1,im1]=nyquist(nG1,dG1);
figure(1);                            
plot(re1,im1,'r','LineWidth',5);              %paint nyquist
title('Nyquist Diagram:intergal element');
legend('Twsa line');
xlabel('real part ');
ylabel('imaginary part');
axis([0,0.5,-5,5]);                                    %sets scaling for the x- and y-axeson the current plot
grid on;

%Add Bode diagram to Integral-Element
w=logspace(0,3,1000);                %at the space of logarithm,define frequency w
figure(2);
bode(nG1,dG1,w);                       %paint Bode diagram
grid on;
legend('Twsa Line');