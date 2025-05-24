clear all; close all;
syms it(t)

% Tín hiệu vào: Vi(t) = 5*sin(1000*t)
Vi = 5*sin(1000*t);

% Phương trình vi phân: RC*dit/dt + i = C*dVi/dt
ode = 1e3*1e-6*diff(it, t) + it == 1e-6 * diff(Vi, t);
cond = it(0) == 0;
itSol = dsolve(ode, cond);

% Tính điện áp trên R và C
VR = simplify(itSol * 1e3);
VC = simplify(Vi - VR);

% ===== VẼ BIỂU ĐỒ =====
figure(1); grid on;

% 1. Điện áp vào
subplot(2,2,1); grid on; hold on;
fplot(Vi, [0 0.02], 'b', 'LineWidth', 2);
xlim([0 0.02]); ylim([-5.5 5.5]);
xlabel('Thời gian (s)', 'FontSize', 12);
ylabel('Điện áp (V)', 'FontSize', 12);
title('Điện áp vào', 'FontSize', 12);
set(gca, 'FontSize', 10, 'Box', 'on');

% 2. Dòng điện qua mạch
subplot(2,2,2); grid on; hold on;
fplot(itSol, [0 0.02], 'b', 'LineWidth', 2);
xlim([0 0.02]); ylim([-0.004 0.004]);
xlabel('Thời gian (s)', 'FontSize', 12);
ylabel('Dòng điện (A)', 'FontSize', 12);
title('Dòng điện chạy qua mạch', 'FontSize', 12);
set(gca, 'FontSize', 10, 'Box', 'on');

% 3. Điện áp trên điện trở
subplot(2,2,3); grid on; hold on;
fplot(VR, [0 0.02], 'b', 'LineWidth', 2);
xlim([0 0.02]); ylim([-4 4]);
xlabel('Thời gian (s)', 'FontSize', 12);
ylabel('Điện áp (V)', 'FontSize', 12);
title('Điện áp trên điện trở', 'FontSize', 12);
set(gca, 'FontSize', 10, 'Box', 'on');

% 4. Điện áp trên tụ điện
subplot(2,2,4); grid on; hold on;
fplot(VC, [0 0.02], 'b', 'LineWidth', 2);
xlim([0 0.02]); ylim([-4 4]);
xlabel('Thời gian (s)', 'FontSize', 12);
ylabel('Điện áp (V)', 'FontSize', 12);
title('Điện áp trên tụ điện', 'FontSize', 12);
set(gca, 'FontSize', 10, 'Box', 'on');
A