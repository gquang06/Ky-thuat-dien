clear all; close all;
syms it(t) VC VR

% Tín hiệu đầu vào là xung vuông tổ hợp
Vi = heaviside(t) - heaviside(t - 2e-3) + ...
     heaviside(t - 4e-3) - heaviside(t - 6e-3) + ...
     heaviside(t - 8e-3) - heaviside(t - 10e-3);

% Phương trình vi phân: RC*dit/dt + i = C*dVi/dt
ode = 1e3 * 1e-6 * diff(it, t) + it == 1e-6 * diff(Vi, t);
cond = it(0) == 0.5e-3;
itSol = dsolve(ode, cond);

% Điện áp trên điện trở và tụ điện
VR = simplify(itSol * 1e3);
VC = simplify(Vi - VR);

% ======= Vẽ biểu đồ =======
figure(1); grid on;

% 1. Tín hiệu vào
subplot(2,2,1); grid on; hold on;
fplot(Vi, [0 12e-3], 'b', 'LineWidth', 2);
xlim([0 0.012]); ylim([-0.1 1.1]);
xlabel('Thời gian (s)', 'FontSize', 12);
ylabel('Điện áp (V)', 'FontSize', 12);
title('Điện áp vào', 'FontSize', 12);
set(gca, 'FontSize', 10, 'Box', 'on');

% 2. Dòng điện mạch
subplot(2,2,2); grid on; hold on;
fplot(itSol, [0 12e-3], 'b', 'LineWidth', 2);
xlim([0 0.012]); ylim([-1e-3 1e-3]);
xlabel('Thời gian (s)', 'FontSize', 12);
ylabel('Dòng điện (A)', 'FontSize', 12);
title('Dòng điện chạy qua mạch', 'FontSize', 12);
set(gca, 'FontSize', 10, 'Box', 'on');

% 3. Điện áp trên điện trở
subplot(2,2,3); grid on; hold on;
fplot(VR, [0 12e-3], 'b', 'LineWidth', 2);
xlim([0 0.012]); ylim([-1 1]);
xlabel('Thời gian (s)', 'FontSize', 12);
ylabel('Điện áp (V)', 'FontSize', 12);
title('Điện áp trên điện trở', 'FontSize', 12);
set(gca, 'FontSize', 10, 'Box', 'on');

% 4. Điện áp trên tụ điện
subplot(2,2,4); grid on; hold on;
fplot(VC, [0 12e-3], 'b', 'LineWidth', 2);
xlim([0 0.012]); ylim([0 1]);
xlabel('Thời gian (s)', 'FontSize', 12);
ylabel('Điện áp (V)', 'FontSize', 12);
title('Điện áp trên tụ điện', 'FontSize', 12);
set(gca, 'FontSize', 10, 'Box', 'on');
