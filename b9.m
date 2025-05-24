clear all; close all; % Nguyễn Gia Quang 24020619
syms it t R C Vi;

% Giải phương trình vi phân
it = dsolve('R*C*Dit + it = 0', 'it(0) = Vi/R');
vt = (1/C) * int(it, 0, t);

% ======= Tạo figure với 3 subplot ==========
figure;

% ======= Subplot 1: Dòng điện qua mạch ==========
subplot(3,1,1); grid on; hold on;
itn1 = subs(it, [R C Vi], [1e3 1e-5 1]);
fplot(itn1, [0 0.05], 'r--', 'LineWidth', 2);
itn2 = subs(it, [R C Vi], [5e3 1e-5 1]);
fplot(itn2, [0 0.05], 'b-.', 'LineWidth', 2);
itn3 = subs(it, [R C Vi], [10e3 1e-5 1]);
fplot(itn3, [0 0.05], 'k-', 'LineWidth', 2);
xlim([0 0.05]);
ylim([0 1e-3]);
xlabel('Time (s)', 'FontSize', 12);
ylabel('Current (A)', 'FontSize', 12);
title('Current through circuit', 'FontSize', 14);
legend('R = 1 k\Omega', 'R = 5 k\Omega', 'R = 10 k\Omega', 'Location', 'northeast');
set(gca, 'FontSize', 10, 'Box', 'on');

% ======= Subplot 2: Điện áp trên tụ ==========
subplot(3,1,2); grid on; hold on;
vtn1 = subs(vt, [R C Vi], [1e3 1e-5 1]);
fplot(vtn1, [0 0.05], 'r--', 'LineWidth', 2);
vtn2 = subs(vt, [R C Vi], [5e3 1e-5 1]);
fplot(vtn2, [0 0.05], 'b-.', 'LineWidth', 2);
vtn3 = subs(vt, [R C Vi], [10e3 1e-5 1]);
fplot(vtn3, [0 0.05], 'k-', 'LineWidth', 2);
xlim([0 0.05]);
ylim([0 1.1]);
xlabel('Time (s)', 'FontSize', 12);
ylabel('Capacitor voltage (V)', 'FontSize', 12);
title('Voltage across capacitor', 'FontSize', 14);
legend('R = 1 k\Omega', 'R = 5 k\Omega', 'R = 10 k\Omega', 'Location', 'southeast');
set(gca, 'FontSize', 10, 'Box', 'on');

% ======= Subplot 3: Điện áp trên điện trở ==========
subplot(3,1,3); grid on; hold on;
vr = Vi - vt;
vrn1 = subs(vr, [R C Vi], [1e3 1e-5 1]);
fplot(vrn1, [0 0.05], 'r--', 'LineWidth', 2);
vrn2 = subs(vr, [R C Vi], [5e3 1e-5 1]);
fplot(vrn2, [0 0.05], 'b-.', 'LineWidth', 2);
vrn3 = subs(vr, [R C Vi], [10e3 1e-5 1]);
fplot(vrn3, [0 0.05], 'k-', 'LineWidth', 2);
xlim([0 0.05]);
ylim([0 1.1]);
xlabel('Time (s)', 'FontSize', 12);
ylabel('Resistor voltage (V)', 'FontSize', 12);
title('Voltage across resistor', 'FontSize', 14);
legend('R = 1 k\Omega', 'R = 5 k\Omega', 'R = 10 k\Omega', 'Location', 'northeast');
set(gca, 'FontSize', 10, 'Box', 'on');
