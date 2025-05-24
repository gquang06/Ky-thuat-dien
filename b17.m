clear all; close all;
syms V(t) IL IR IC i_n(t) k

% Nguồn dòng vào
i_n(t) = 0.2 * exp(-1000*t);

% Đạo hàm bậc 1 và 2 của V(t)
DV = diff(V, t);
D2V = diff(V, t, 2);

% Phương trình vi phân (đưa về dạng đúng với Symbolic)
% 1e-6 * D2V + 4e-3 * DV + 250 * V = -200 * exp(-1000*t)
ode = 1e-6 * D2V + 4e-3 * DV + 250 * V == -200 * exp(-1000*t);

% Điều kiện ban đầu: DV(0) = 0.2e6, V(0) = 0
conds = [V(0) == 0, DV(0) == 0.2e6];

% Giải phương trình
Vsol(t) = dsolve(ode, conds);

% Tính dòng điện các nhánh
IL = simplify(250e3 * int(Vsol, t, 0, t));       % Dòng qua L (tích phân điện áp)
IR = simplify(Vsol / 250);                      % Dòng qua R
IC = simplify(1e-6 * diff(Vsol, t) * 1e3);       % Dòng qua C, scale *1e3 như gốc

% ======= Vẽ điện áp =======
figure(1); grid on; hold on;
fplot(Vsol, [0 3e-3], 'b', 'LineWidth', 2);
xlabel('Thời gian (s)', 'FontSize', 12);
ylabel('Điện áp V(t) (V)', 'FontSize', 12);
title('Điện áp trên mạch song song RLC');
set(gca, 'FontSize', 12, 'Box', 'on');

% ======= Vẽ dòng điện các nhánh =======
figure(2);

% Nguồn dòng vào
subplot(2,2,1); grid on; hold on;
fplot(i_n, [0 3e-3], 'k', 'LineWidth', 2);
title('Nguồn dòng i_n(t)');
xlabel('Thời gian (s)'); ylabel('Dòng điện (A)');

% Dòng qua cuộn cảm
subplot(2,2,2); grid on; hold on;
fplot(IL, [0 3e-3], 'b', 'LineWidth', 2);
title('Dòng qua cuộn cảm IL');
xlabel('Thời gian (s)'); ylabel('Dòng điện (A)');

% Dòng qua điện trở
subplot(2,2,3); grid on; hold on;
fplot(IR, [0 3e-3], 'r', 'LineWidth', 2);
title('Dòng qua điện trở IR');
xlabel('Thời gian (s)'); ylabel('Dòng điện (A)');

% Dòng qua tụ điện
subplot(2,2,4); grid on; hold on;
fplot(IC, [0 3e-3], 'g', 'LineWidth', 2);
title('Dòng qua tụ điện IC');
xlabel('Thời gian (s)'); ylabel('Dòng điện (A)');
