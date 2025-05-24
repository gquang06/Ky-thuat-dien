% Nguyễn Gia Quang 24020619
clear all; close all;
syms it(t) R L Vi

% Giải phương trình vi phân: R*it + L*dit/dt = Vi, it(0) = 0
ode = R*it + L*diff(it, t) == Vi;
cond = it(0) == 0;
itSol = dsolve(ode, cond);

% Tính điện áp trên cuộn cảm
vt = L * diff(itSol, t);

% ======= Hình 1: Dòng điện qua mạch RL ==========
figure; grid on; hold on;
subplot(2,1,1); grid on; hold on;

% Vẽ với R = 10, 50, 100 Ω
itn1 = subs(itSol, [R L Vi], [10 0.1 100]);
fplot(itn1, [0 0.05], 'r--', 'LineWidth', 2);

itn2 = subs(itSol, [R L Vi], [50 0.1 100]);
fplot(itn2, [0 0.05], 'b-.', 'LineWidth', 2);

itn3 = subs(itSol, [R L Vi], [100 0.1 100]);
fplot(itn3, [0 0.05], 'k-', 'LineWidth', 2);

xlim([0 0.05]);
ylim([0 11]);
xlabel('Time (s)', 'FontSize', 14);
ylabel('Current (A)', 'FontSize', 14);
set(gca, 'FontSize', 12, 'Box', 'on');
legend('R = 10 \Omega', 'R = 50 \Omega', 'R = 100 \Omega', 'Location', 'northwest');

% ======= Hình 2: Điện áp trên cuộn cảm ==========
subplot(2,1,2); grid on; hold on;

vtn1 = subs(vt, [R L Vi], [10 0.1 100]);
fplot(vtn1, [0 0.05], 'r--', 'LineWidth', 2);

vtn2 = subs(vt, [R L Vi], [50 0.1 100]);
fplot(vtn2, [0 0.05], 'b-.', 'LineWidth', 2);

vtn3 = subs(vt, [R L Vi], [100 0.1 100]);
fplot(vtn3, [0 0.05], 'k-', 'LineWidth', 2);

xlim([0 0.05]);
ylim([0 101]);
xlabel('Time (s)', 'FontSize', 14);
ylabel('Voltage (V)', 'FontSize', 14);
set(gca, 'FontSize', 12, 'Box', 'on');
legend('R = 10 \Omega', 'R = 50 \Omega', 'R = 100 \Omega', 'Location', 'northeast');

