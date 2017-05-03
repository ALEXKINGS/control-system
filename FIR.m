%     y = y + 0.5*rand(size(y));          
% SR=8000;    %采样频率
% FC=697;      %频带的中心频率，单位Hz
% NTPS=202;
% h=fir1(NTPS-1,[0.98*FC,1.02*FC]/(SR/2),'DC-0');
% 
% figure;
% subplot(211); plot(y,'h'); title('Original Signal')
 
% Example 2:
    %   The chirp.mat file contains a signal, y, that has most of its power
    %   above fs/4, or half the Nyquist frequency. Design a 34th-order FIR
    %   highpass filter to attenuate the components of the signal below
    %   fs/4. Use a cutoff frequency of 0.48 and a Chebyshev window with
    %   30 dB of ripple.
 
    load chirp;                     % Load data (y and Fs) into workspace
    y = y + 0.5*rand(size(y));                  % Adding noise
    b = fir1(34,0.48,'high',chebwin(35,30));    % FIR filter design
    freqz(b,1,512);                 % Frequency response of filter
    output = filtfilt(b,1,y);       % Zero-phase digital filtering
    figure;
    subplot(211); plot(y,'b'); title('Original Signal')
    subplot(212); plot(output,'g'); title('Filtered Signal')
    