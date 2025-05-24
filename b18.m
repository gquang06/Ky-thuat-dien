clear all; close all;
syms v1(t) v2(t)
% Nguyễn Gia Quang 24020619

% Hệ phương trình vi phân
eq1 = diff(v1, t) + 2*v1 - v2 == 10;
eq2 = diff(v2, t) + 2*v2 - v1 == 0;

% Điều kiện ban đầu
cond1 = v1(0) == 0;
cond2 = v2(0) == 0;

% Giải hệ phương trình
sol = dsolve([eq1, eq2], [cond1, cond2]);
v1Sol = simplify(sol.v1);
v2Sol = simplify(sol.v2);

% Vẽ đồ thị
figure;
fplot(v1Sol, [0 10], 'r-', 'LineWidth', 2); hold on;
fplot(v2Sol, [0 10], 'b--', 'LineWidth', 2);
grid on;

xlabel('Thời gian (t)', 'FontSize', 12);
ylabel('Đáp ứng (v1, v2)', 'FontSize', 12);
title('Đáp ứng của hệ phương trình vi phân', 'FontSize', 14);
legend('v1(t)', 'v2(t)', 'Location', 'best');
set(gca, 'FontSize', 12, 'Box', 'on');
