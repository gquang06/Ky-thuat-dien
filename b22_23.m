% Nguyễn Gia Quang 24020619

syms t v p;
% Khởi tạo biến
v = 100*cos(100*pi*t);
p = v^2 / 50;

v_fun = matlabFunction(v);
p_fun = matlabFunction(p);

% khoảng thời gian để vẽ đồ thị
t_vals = linspace(0, 0.1, 1000);  % 0 to 0.1 seconds

% Tính giá trị của v(t) và p(t) tại các thời điểm t
v_vals = v_fun(t_vals);
p_vals = p_fun(t_vals);

% vẽ đồ thị điện áp và công suất
figure;
subplot(2,1,1);
plot(t_vals, v_vals, 'b');
title('Voltage vs Time');
xlabel('Time (s)');
ylabel('Voltage (V)');
grid on;

subplot(2,1,2);
plot(t_vals, p_vals, 'r');
title('Power vs Time');
xlabel('Time (s)');
ylabel('Power (W)');
grid on;
