n = 40;			% количество точек замера
l = 2.5;
h = l / n;
D = 2;

M = zeros(n-1, n-1);

for i = 2:n-1
	for j = 1:n-1
		if abs(i-j) == 1
			M(i,j) = D / h^2;
		end
		if i == j
			M(i,j) = -2 * D / h^2;
		end
	end
end

M(1, :) = M(2, :);	% потому что принимаем равенство u_1 и u_2

F = @(x) x^3 - 6.25 * x;

init = zeros(n-1, 1);
for i = 1:(n-1)
	init(i) = F((i-1)*h);
end
init(1) = init(2);

f = @(t, x) M*x;

[t, y] = ode45(f, [0 7], init);

for i=length(y)-50:length(y)
((y(2,n/2) - y(1,n/2)) / (t(2) - t(1))) / ((y(i,n/2) - y(i-1,n/2)) / (t(i) - t(i-1)))
end

hold on;
miny = min(min(y));
maxy = max(max(y));
frnum = 1;
%for i=1:20:80
for i=1:80:160
	plot([y(i, :) 0], 'DisplayName', strcat('Ўаг #', int2str(i)));
	%axis([1 n miny maxy+1]);
	axis([1 n -6 1]);
end
%for i=81:40:280
for i=161:80:320
	plot([y(i, :) 0], 'DisplayName', strcat('Ўаг #', int2str(i)));
	%axis([1 n miny maxy+1]);
	axis([1 n -6 1]);
end
for i=321:200:1500
	plot([y(i, :) 0], 'DisplayName', strcat('Ўаг #', int2str(i)));
	%axis([1 n miny maxy+1]);
	axis([1 n -6 1]);
end
title('—жатие II, N = 40');
legend('show')