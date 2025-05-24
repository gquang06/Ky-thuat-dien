clear all; close all;
syms it(t) t

% Tín hiệu vào: xung tam giác tổ hợp
Vi = 500 * ( ...
    (heaviside(t)-heaviside(t-2e-3))*t + ...
    (heaviside(t-2e-3)-heaviside(t-4e-3))*(4e-3 - t) + ...
    (heaviside(t-4e-3)-heaviside(t-6e-3))*(t - 4e-3) + ...
    (heaviside(t-6e-3)-heaviside(t-8e-3))*(8e-3 - t) + ...
    (heaviside(t-8e-3)-heaviside(t-10e-3))*(t - 8e-3) + ...
    (heaviside(t-10e-3)-heaviside(t-12e-3))*(12e-3 - t) );

% Giải phương trình vi phân
ode = 1e3 * 1e-6 * diff(it, t) + it == 1e-6 * diff(Vi, t);
cond = it(0) == 0;
itSol = dsolve(ode, cond);

% Điện áp trên điện trở và tụ điện
VR = simplify(itSol * 1e3);
VC = simplify(Vi - VR);

% ======= VẼ BIỂU ĐỒ =======
figure(1); grid on;

% 1. Tín hiệu vào
subplot(2,2,1); grid on; hold on;
fplot(Vi, [0 12e-3], 'b', 'LineWidth', 2);
xlim([0 0.012]); ylim([-0.1 1.1]);
xlabel('Thời gian (s)', 'FontSize', 12);
ylabel('Điện áp (V)', 'FontSize', 12);
title('Điện áp vào', 'FontSize', 12);
set(gca, 'FontSize', 10, 'Box', 'on');

% 2. Dòng điện qua mạch
subplot(2,2,2); grid on; hold on;
fplot(itSol, [0 12e-3], 'b', 'LineWidth', 2);
xlim([0 0.012]); ylim([-0.5e-3 0.5e-3]);
xlabel('Thời gian (s)', 'FontSize', 12);
ylabel('Dòng điện (A)', 'FontSize', 12);
title('Dòng điện chạy qua mạch', 'FontSize', 12);
set(gca, 'FontSize', 10, 'Box', 'on');

% 3. Điện áp trên điện trở
subplot(2,2,3); grid on; hold on;
fplot(VR, [0 12e-3], 'b', 'LineWidth', 2);
xlim([0 0.012]); ylim([-0.5 0.5]);
xlabel('Thời gian (s)', 'FontSize', 12);
ylabel('Điện áp (V)', 'FontSize', 12);
title('Điện áp trên điện trở', 'FontSize', 12);
set(gca, 'FontSize', 10, 'Box', 'on');

% 4. Điện áp trên tụ điện
subplot(2,2,4); grid on; hold on;
fplot(VC, [0 12e-3], 'b', 'LineWidth', 2);
xlim([0 0.012]); ylim([0 0.8]);
xlabel('Thời gian (s)', 'FontSize', 12);
ylabel('Điện áp (V)', 'FontSize', 12);
title('Điện áp trên tụ điện', 'FontSize', 12);
set(gca, 'FontSize', 10, 'Box', 'on');
