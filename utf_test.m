% matlab如何读取utf-8编码的txt文档？
clear;
clc;
disp('*****使用默认编码方式读取utf-8编码的txt文档*****')
fp = fopen('test.txt','r','n');
s1 = fgets(fp)
fclose(fp);
disp('*****使用utf-8编码方式读取utf-8编码的txt文档*****')
fp = fopen('test.txt','r','n','utf-8');
s2 = fgets(fp)
fclose(fp);