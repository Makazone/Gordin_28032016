h = 0.1;
N = 20;
eps = 0.05;

K = @(x, s) x+s;
f = @(x) x;

edge = @(i) 1 - (i==1)/2 - (i==N)/2;
grid = @(i) (i-1)*h;

M1 = zeros(N, N);
for i=1:N
	for j=1:N

		if i == j
			M1(i,i) = 4/h;
		end
		if abs(i-j) == 1
			M1(i,j) = -2/h;
		end

	end
end
M1(1,1) = 2/h;
M1(N,N) = 2/h;

M2 = zeros(N, N);
init = zeros(N, 1);
for var=1:N
	for i=1:N
		for j=1:N
			M2(var,j) = M2(var,j) + 2*h^3 * edge(i) * edge(j) * K(grid(i), grid(var)) * K(grid(i), grid(j));
			init(var) = init(var) - 2*h^3 * edge(i) * edge(j) * K(grid(i), grid(var)) * f(grid(i));
		end
	end
end

hold on;

eps = 0.05;
M = eps*M1 + M2;
sol = linsolve(M, -init);
sol
plot(sol);

eps = 0.1;
M = eps*M1 + M2;
sol = linsolve(M, -init);
sol
plot(sol);

eps = 0.2;
M = eps*M1 + M2;
sol = linsolve(M, -init);
sol
plot(sol);

eps = 0.01;
M = eps*M1 + M2;
sol = linsolve(M, -init);
sol
plot(sol);

eps = 0.005;
M = eps*M1 + M2;
sol = linsolve(M, -init);
sol
plot(sol);

eps = 0.002;
M = eps*M1 + M2;
sol = linsolve(M, -init);
sol
plot(sol);

eps = 0.0005;
M = eps*M1 + M2;
sol = linsolve(M, -init);
sol
plot(sol);

eps = 0.0001;
M = eps*M1 + M2;
sol = linsolve(M, -init);
sol
plot(sol);

eps = 0.00001;
M = eps*M1 + M2;
sol = linsolve(M, -init);
sol
plot(sol);

eps = 0.000001;
M = eps*M1 + M2;
sol = linsolve(M, -init);
sol
plot(sol);

eps = 0.0000001;
M = eps*M1 + M2;
sol = linsolve(M, -init);
sol
plot(sol);

eps = 0.00000001;
M = eps*M1 + M2;
sol = linsolve(M, -init);
sol
plot(sol);

% eps = 1e-17: everything breaks
% eps = 12 * 1e-16

hold off;