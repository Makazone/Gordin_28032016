n = 40;			% количество точек замера
l = 2.5;
h = l / n;
D = 2;
nu = 0.48;
tau = nu * h^2 / D;

M = zeros(n-1, n-1);

for i = 2:n-1
	for j = 1:n-1
		if abs(i-j) == 1
			M(i,j) = D * tau / h^2;
		end
		if i == j
			M(i,j) = 1 - 2 * D * tau / h^2;
		end
	end
end

M(1, :) = M(2, :);	% потому что принимаем равенство u_1 и u_2

F = @(x) x^3 - 6.25 * x;

init = zeros(n-1, 1);
for i = 1:(n-1)
	init(i) = F((i-1)*h);
end

solution = @(steps) M^steps * init;

hold on;
%for i=1:5:15
%for i=1:10:40
for i=1:15:60
	plot([solution(i); 0], 'DisplayName', strcat('Ўаг #', int2str(i)));
	axis([1 n -6 1]);
end
%for i=41:40:120
for i=61:60:240
	plot([solution(i); 0], 'DisplayName', strcat('Ўаг #', int2str(i)));
	axis([1 n -6 1]);
end
%for i=16:40:221
%for i=121:60:281
for i=241:120:700
	plot([solution(i); 0], 'DisplayName', strcat('Ўаг #', int2str(i)));
	axis([1 n -6 1]);
end
title('—жатие III, N = 40');
legend('show')