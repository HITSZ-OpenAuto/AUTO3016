% 直流电动机机械特性实验数据分析 (正反转对比)
clear; clc; close all;

% --- 1. 实验常数定义 ---
g = 9.8;           % 重力加速度 (m/s^2)
r = 0.015;         % 绕线轮半径 (m)
Z = 1564;          % 编码器线数 (lines)

% --- 2. 实验数据录入 (质量 m: kg, 频率 f: Hz) ---
m_loads = [0, 0.4, 1.0, 2.0, 3.0]; % 负载质量点

% 正转数据 (来自第五部分)
f_60 = [345, 292, 282, 230, 181];
f_70 = [808, 790, 740, 700, 610];
f_80 = [1220, 1250, 1220, 1131, 1080];

% 反转数据 (来自第六部分)
f_40 = [338, 285, 270, 225, 175];
f_30 = [795, 778, 730, 692, 605];
f_20 = [1210, 1205, 1140, 1115, 1065];

% --- 3. 数据计算 (转矩 T_L 与 转速 n) ---
% 计算负载转矩 T_L = m * g * r
T_L = m_loads .* g .* r;

% 计算转速 n = 60 * f / Z (正转为正，反转为负)
calc_n_pos = @(f) (60 .* f) ./ Z;
calc_n_neg = @(f) -1 * (60 .* f) ./ Z;

n_60 = calc_n_pos(f_60);
n_70 = calc_n_pos(f_70);
n_80 = calc_n_pos(f_80);

n_40 = calc_n_neg(f_40);
n_30 = calc_n_neg(f_30);
n_20 = calc_n_neg(f_20);

% --- 4. 曲线拟合 (线性拟合 n = p1*T + p2) ---
% 使用 polyfit 进行一次多项式拟合
p_60 = polyfit(T_L, n_60, 1);
p_70 = polyfit(T_L, n_70, 1);
p_80 = polyfit(T_L, n_80, 1);

p_40 = polyfit(T_L, n_40, 1);
p_30 = polyfit(T_L, n_30, 1);
p_20 = polyfit(T_L, n_20, 1);

% 生成拟合直线
T_fit = linspace(0, 0.5, 100);
fit_60 = polyval(p_60, T_fit);
fit_70 = polyval(p_70, T_fit);
fit_80 = polyval(p_80, T_fit);
fit_40 = polyval(p_40, T_fit);
fit_30 = polyval(p_30, T_fit);
fit_20 = polyval(p_20, T_fit);

% --- 5. 打印拟合函数表达式 ---
fprintf('=== 正转拟合函数 ===\n');
fprintf('D=60%%: n = %.2f * T + %.2f\n', p_60(1), p_60(2));
fprintf('D=70%%: n = %.2f * T + %.2f\n', p_70(1), p_70(2));
fprintf('D=80%%: n = %.2f * T + %.2f\n', p_80(1), p_80(2));
fprintf('\n=== 反转拟合函数 ===\n');
fprintf('D=40%%: n = %.2f * T + %.2f\n', p_40(1), p_40(2));
fprintf('D=30%%: n = %.2f * T + %.2f\n', p_30(1), p_30(2));
fprintf('D=20%%: n = %.2f * T + %.2f\n', p_20(1), p_20(2));

% --- 6. 绘图 ---
figure('Name', '直流电动机机械特性全图', 'Color', 'w');
hold on; grid on; box on;

% 绘制正转曲线 (MarkerFaceColor 使用标准颜色缩写)
plot(T_L, n_60, 'bo', 'MarkerFaceColor', 'b', 'DisplayName', '60% 实验点');
plot(T_fit, fit_60, 'b--', 'LineWidth', 1.5, 'DisplayName', '60% 拟合线');

plot(T_L, n_70, 'go', 'MarkerFaceColor', 'g', 'DisplayName', '70% 实验点');
plot(T_fit, fit_70, 'g--', 'LineWidth', 1.5, 'DisplayName', '70% 拟合线');

plot(T_L, n_80, 'ro', 'MarkerFaceColor', 'r', 'DisplayName', '80% 实验点');
plot(T_fit, fit_80, 'r--', 'LineWidth', 1.5, 'DisplayName', '80% 拟合线');

% 绘制反转曲线 (修复 'lime' 报错，改为标准颜色)
% D=40%: 青色 (Cyan)
plot(T_L, n_40, 'bs', 'MarkerFaceColor', 'c', 'DisplayName', '40% 实验点');
plot(T_fit, fit_40, 'b-.', 'LineWidth', 1.5, 'DisplayName', '40% 拟合线');

% D=30%: 绿色 (Green - 替代 lime)
plot(T_L, n_30, 'gs', 'MarkerFaceColor', 'g', 'DisplayName', '30% 实验点');
plot(T_fit, fit_30, 'g-.', 'LineWidth', 1.5, 'DisplayName', '30% 拟合线');

% D=20%: 品红 (Magenta)
plot(T_L, n_20, 'rs', 'MarkerFaceColor', 'm', 'DisplayName', '20% 实验点');
plot(T_fit, fit_20, 'r-.', 'LineWidth', 1.5, 'DisplayName', '20% 拟合线');

% 图表修饰
y_line = yline(0, 'k-', 'LineWidth', 1); set(get(get(y_line,'Annotation'),'LegendInformation'),'IconDisplayStyle','off'); % 0轴
xlabel('负载转矩 T_L (N·m)', 'FontSize', 12);
ylabel('转速 n (r/min)', 'FontSize', 12);
title('直流电动机正反转机械特性曲线实验对比', 'FontSize', 14);
legend('Location', 'bestoutside'); % 图例放在外侧以免遮挡
axis([0 0.5 -60 60]);