% matlab��ζ�ȡutf-8�����txt�ĵ���
clear;
clc;
disp('*****ʹ��Ĭ�ϱ��뷽ʽ��ȡutf-8�����txt�ĵ�*****')
fp = fopen('test.txt','r','n');
s1 = fgets(fp)
fclose(fp);
disp('*****ʹ��utf-8���뷽ʽ��ȡutf-8�����txt�ĵ�*****')
fp = fopen('test.txt','r','n','utf-8');
s2 = fgets(fp)
fclose(fp);