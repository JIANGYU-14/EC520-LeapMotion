clear

xdata = xlsread('triangle2.xls','A:A'); % Predefinied Shape
ydata = xlsread('triangle2.xls','B:B');

xxdata = xlsread('bu5.xls','A:A'); % Input New Shape
yydata = xlsread('bu5.xls','B:B');

len = size(xdata,1);
dis = zeros(len,1);

xmid = mean(xdata);
ymid = mean(ydata);

xxmid = mean(xxdata);
yymid = mean(yydata);

for i = (1:1:len)
    dis(i) = sqrt((xdata(i)-xmid)^2 + (ydata(i)-ymid)^2);
end

xaxis = (1:1:len);
%plot(xaxis,dis);

dismin = min(dis);
err = abs(dis - dismin);

subplot(2,1,1)
% plot(xdata,-ydata,xmid,-ymid,'-o');
plot(xdata,-ydata);
%axis([-300 300 -150 150]);
title('Original Shape')
xlabel('Millimetre');

% subplot(1,2,2)
% plot(xxdata,-yydata,xxmid,-yymid,'-o'); 
% %axis([-300 300 -150 150]);
% title('Test Shape')
% xlabel('Millimetre');


subplot(2,1,2)
plot(xaxis,xdata);hold on;
plot(xaxis,-ydata,'--');hold on;
%plot(xaxis,err,'x');
legend('X-20','Z-20');title('Coordinates of Each Frame');
xlabel('Millimetre');

% cmplx = complex(xdata,ydata);
% ft_cmplx = fft(cmplx);
% Mn_cmplx = abs(ft_cmplx);
% subplot(3,1,3)
% plot(1:1:len,Mn_cmplx);
% 
% xxx = [xdata ydata];

%%
x_pre = what(xdata,len);
z_pre = what(ydata,len);

if x_pre < 25 && z_pre < 25
    fprintf('This is a Circle\n')
else
    diff = abs(x_pre-z_pre);
    lar = max(x_pre,z_pre);
    ratio = diff/lar;
    if ratio > 0.75
        fprintf('This is a Triangle\n')
    else
        fprintf('This is a Square\n')
    end
end


%%
function ret = what(data,len)
n = 1;
k = 0;
winlen = round(0.2*len);
while n+winlen<len
    win = data(n:n+winlen,1);
    if std(win)<10
        k = k +1;
    end
    n = n+1;
end

win = data(n:end,1);
if std(win)<10
        k = k +1;
end
ret = k;
end
