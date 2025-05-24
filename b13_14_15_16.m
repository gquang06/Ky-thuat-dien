close all; clear all; % Nguyễn Gia Quang 24020619
syms vc(t) R L C vi

% Phương trình vi phân mạch RLC: 
% d2vc/dt2 + (R/L)*dvc/dt + (1/(L*C))*vc = (1/(L*C))*vi
ode = diff(vc, t, 2) + (R/L)*diff(vc, t) + (1/(L*C))*vc == (1/(L*C))*vi;
cond1 = vc(0) == 0;
dvc = diff(vc, t);           % Tách riêng đạo hàm bậc 1
cond2 = dvc(0) == 0;

% Giải phương trình vi phân với điều kiện ban đầu
vcSol = dsolve(ode, cond1, cond2);

figure; 
subplot(3,1,1); grid on; hold on;

% Các giá trị R khác nhau
vcn1 = subs(vcSol, [R L C vi], [10 10e-3 1e-6 10]);
fplot(vcn1, [0 0.003], 'b--', 'LineWidth', 2);

vcn2 = subs(vcSol, [R L C vi], [100 10e-3 1e-6 10]);
fplot(vcn2, [0 0.003], 'r-.', 'LineWidth', 2);

vcn3 = subs(vcSol, [R L C vi], [200 + 1e-10 10e-3 1e-6 10]);
fplot(vcn3, [0 0.003], 'g-', 'LineWidth', 2);

vcn4 = subs(vcSol, [R L C vi], [300 10e-3 1e-6 10]);
fplot(vcn4, [0 0.003], 'm-', 'LineWidth', 2);

vcn5 = subs(vcSol, [R L C vi], [500 10e-3 1e-6 10]);
fplot(vcn5, [0 0.003], 'k-', 'LineWidth', 2);

xlabel('Thời gian (s)', 'FontSize', 10);
ylabel('Điện áp VC (V)', 'FontSize', 10);
title('VC theo thời gian (R thay đổi)', 'FontSize', 12);
legend({'R = 10 Ω', 'R = 100 Ω', 'R = 200 Ω', 'R = 300 Ω', 'R = 500 Ω'}, 'FontSize', 5, 'Location', 'best');
set(gca, 'FontSize', 10, 'Box', 'on');

subplot(3,1,2); grid on; hold on;
% Các giá trị R khác nhau
vcn1 = subs(vcSol, [R L C vi], [10 10e-3 10e-6 10]);
fplot(vcn1, [0 0.003], 'b--', 'LineWidth', 2);

vcn2 = subs(vcSol, [R L C vi], [100 10e-3 10e-6 10]);
fplot(vcn2, [0 0.003], 'r-.', 'LineWidth', 2);

vcn3 = subs(vcSol, [R L C vi], [200 10e-3 10e-6 10]);
fplot(vcn3, [0 0.003], 'g-', 'LineWidth', 2);

vcn4 = subs(vcSol, [R L C vi], [300 10e-3 10e-6 10]);
fplot(vcn4, [0 0.003], 'm-', 'LineWidth', 2);

vcn5 = subs(vcSol, [R L C vi], [500 10e-3 10e-6 10]);
fplot(vcn5, [0 0.003], 'k-', 'LineWidth', 2);

xlabel('Thời gian (s)', 'FontSize', 10);
ylabel('Điện áp VC (V)', 'FontSize', 10);
title('VC theo thời gian (R thay đổi, C giảm 10 lần)', 'FontSize', 12);
legend({'R = 10 Ω', 'R = 100 Ω', 'R = 200 Ω', 'R = 300 Ω', 'R = 500 Ω'}, 'FontSize', 5, 'Location', 'best');
set(gca, 'FontSize', 10, 'Box', 'on');

subplot(3,1,3); grid on; hold on;
% Các giá trị R khác nhau
vcn1 = subs(vcSol, [R L C vi], [10 1e-3 1e-6 10]);
fplot(vcn1, [0 0.003], 'b--', 'LineWidth', 2);

vcn2 = subs(vcSol, [R L C vi], [100 1e-3 1e-6 10]);
fplot(vcn2, [0 0.003], 'r-.', 'LineWidth', 2);

vcn3 = subs(vcSol, [R L C vi], [200 1e-3 1e-6 10]);
fplot(vcn3, [0 0.003], 'g-', 'LineWidth', 2);

vcn4 = subs(vcSol, [R L C vi], [300 1e-3 1e-6 10]);
fplot(vcn4, [0 0.003], 'm-', 'LineWidth', 2);

vcn5 = subs(vcSol, [R L C vi], [500 1e-3 1e-6 10]);
fplot(vcn5, [0 0.003], 'k-', 'LineWidth', 2);

xlabel('Thời gian (s)', 'FontSize', 10);
ylabel('Điện áp VC (V)', 'FontSize', 10);
title('VC theo thời gian (R thay đổi, L tăng 10 lần)', 'FontSize', 12);
legend({'R = 10 Ω', 'R = 100 Ω', 'R = 200 Ω', 'R = 300 Ω', 'R = 500 Ω'}, 'FontSize', 5, 'Location', 'best');
set(gca, 'FontSize', 10, 'Box', 'on');