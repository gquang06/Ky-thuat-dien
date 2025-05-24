syms t % Nguyễn Gia Quang 24020619
k = 3;
a = 2;
w = 1;
L = 0.5;
C = 1;

ix = k * t^2 * exp(-a * t) * sin(w * t);

vL = L * diff(ix, t);
vL = simplify(vL);

vC = (1 / C) * int(ix, t);
vC = simplify(vC);

vX = vL + vC;

ix_f = matlabFunction(ix);
vL_f = matlabFunction(vL);
vC_f = matlabFunction(vC);
vX_f = matlabFunction(vX);

t_vals = linspace(0, 10, 1000);

figure;
subplot(2,2,1);
plot(t_vals, ix_f(t_vals), 'LineWidth', 1.5);
title('i_x(t)');
xlabel('Time (s)');
ylabel('Current');
grid on;

subplot(2,2,2);
plot(t_vals, vL_f(t_vals), 'r', 'LineWidth', 1.5);
hold on;
plot(t_vals, vC_f(t_vals), 'g', 'LineWidth', 1.5);
plot(t_vals, vX_f(t_vals), 'm', 'LineWidth', 1.5);
title('v_L(t), v_C(t), v_X(t) = v_C(t) + v_L(t)');
xlabel('Time (s)');
ylabel('Voltage');
grid on;
legend('v_L(t)', 'v_C(t)', 'v_X(t)');
