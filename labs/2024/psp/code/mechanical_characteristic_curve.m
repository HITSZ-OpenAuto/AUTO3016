clc, clear, close all;

% 构造数据列表
% positive_frequency 和 negative_frequency 是频率，和转速成正比，T 是转矩
positive_frequency = [308.37, 259.75, 259.00, 235.90, 196.14, 740.6263, 729.4413, 685.6115, 656.1776, 639.1157, 1.14231e3, 1.09859e3, 1.07358e3, 1.05385e3, 1.04392e3];
negative_frequency = [1.2594e3, 1.1826e3, 1.1560e3, 1.1405e3, 1.1259e3, 736.2287, 702.4193, 691.4483, 649.1795, 606.8259, 308.37, 259.75, 259.00, 235.90, 196.14];
T = [0, 0.0941, 0.1411, 0.1882, 0.2352];
plot(T, positive_frequency(1:5), T, positive_frequency(6:10), T, positive_frequency(11:15));
figure(1);
title('正转时机械特性');
legend('占空比40%', '占空比30%', '占空比20%');
xlabel('转矩(N\cdot m)');
ylabel('转速(rpm)')
grid on;
figure(2);
plot(T, negative_frequency(1:5), T, negative_frequency(6:10), T, negative_frequency(11:15));
title('反转时机械特性');
legend('占空比20%', '占空比30%', '占空比40%');
xlabel('转矩(N\cdot m)');
ylabel('转速(rpm)')
grid on;
