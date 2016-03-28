n = 10;			% количество точек замера
l = 2.5;
h = l / n;
c = 1;

M = zeros(2*(n-1), 2*(n-1));
u = @(i) 2*i-1;
v = @(i) 2*i;

for i = 1:n-2
	for j = 1:n-1
		if abs(i-j) == 1
			M(v(i),u(j)) = c^2 / h^2;
		end
		if i == j
			M(v(i),u(j)) = -2 * c^2 / h^2;
		end
	end
end

for i = 1:n-1
	M(u(i), v(i)) = 1;	% du(i) = v(i)
end

M(v(n-1), :) = M(v(n-2), :);	% потому что принимаем равенство u_последнего и u_предпоследнего

F = @(x) x^3 - 6.25 * x;
G = @(x) x^3 - 6.25 * x;

init = zeros(2*(n-1), 1);
for i = 1:(n-1)
	init(u(i)) = F((i-1)*h);
	init(v(i)) = G((i-1)*h);
end
init(u(n-1)) = init(u(n-2));
init(v(n-1)) = init(v(n-2));

f = @(t, x) M*x;

[t, y] = ode45(f, [0 18], init);
solution = y(:, 1:2:2*n-2);	% решение

hold on;
miny = min(min(solution));
maxy = max(max(solution));
% 1:30:260
% 1:60:500
% 1:100:901
for i=1:30:260
	plot([0 solution(i, :)], 'DisplayName', strcat('Шаг #', int2str(i)));
	axis([1 n miny maxy]);
end
title('Изометрия II, N = 10');
legend('show')