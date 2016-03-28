K = @(x, s) x+s;
f = @(x) x;

res = [];

for N = 30:10:130
for eps = 12.9:0.0005:13
	h = 1/N;

	M = zeros(N+1, N+1);
	fv = zeros(N+1, 1);

	for i = 1:N+1
		x = (i-1) * h;
		M(i, 1) = h * eps * K(x, 0) / 2;
		for j = 2:N
			s = (j-1) * h;
			M(i, j) = h * eps * K(x, s);
			if i == j
				M(i, j) = M(i, j) + 1;
			end
		end
		M(i, N+1) = h * eps * K(x, h*N) / 2;
	end
	M(1, 1) = M(1, 1) + 1;
	M(N+1, N+1) = M(N+1, N+1) + 1;

	for i = 1:N+1
		x = (i-1) * h;
		fv(i) = f(x);
	end

	if min(real(eig(M))) < 0.000
		res(end+1) = eps;
		N
		eps
		break
	end
end
end

plot(30:10:130, res);