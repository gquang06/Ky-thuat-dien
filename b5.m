syms t t1 
C = 0.5e-12;

% Dòng điện qua tụ điện theo từng khoảng thời gian
iC = 2.5 * t * (heaviside(t) - heaviside(t - 2e-3)) ...
   + 5e-3 * (heaviside(t - 2e-3) - heaviside(t - 4e-3)) ...
   - 10e-3 * sin(500 * pi * t) * (heaviside(t - 4e-3) - heaviside(t - 6e-3));

% Biến thay thế trong tích phân
iC1 = 2.5 * t1 * (heaviside(t1) - heaviside(t1 - 2e-3)) ...
    + 5e-3 * (heaviside(t1 - 2e-3) - heaviside(t1 - 4e-3)) ...
    - 10e-3 * sin(500 * pi * t1) * (heaviside(t1 - 4e-3) - heaviside(t1 - 6e-3));

% Điện áp trên tụ điện
vC = (1 / C) * int(iC1, t1, 0, t);

% Hàm ẩn danh để vẽ
iC_f = matlabFunction(iC);
vC_f = matlabFunction(vC);

% Miền thời gian từ -2ms đến 8ms
t_vals = linspace(-2e-3, 8e-3, 1000);

% Vẽ biểu đồ
figure;

subplot(1,2,1);
plot(t_vals, iC_f(t_vals), 'LineWidth', 1.5);
title('i_C(t) - Dòng qua tụ');
xlabel('Time (s)');
ylabel('Current (A)');
grid on;

subplot(1,2,2);
plot(t_vals, vC_f(t_vals), 'LineWidth', 1.5);
title('v_C(t) - Điện áp tụ');
xlabel('Time (s)');
ylabel('Voltage (V)');
grid on;
