 % LICENSE
 %
 % ----------------------------------------------------------------------------
 % "THE BEER-WARE LICENSE" (Revision 42):
 % <mail@vaccarium.ru> wrote this file. As long as you retain this notice you
 % can do whatever you want with this stuff. If we meet some day, and you think
 % this stuff is worth it, you can buy me a beer in return
 % ----------------------------------------------------------------------------
 %

l = 1;
N = 10;
h = l / N;
eps = 0.1460;

edge = @(i) (i ~= 1) / 2 + (i ~= N) / 2;
getx = @(i) (i - 1) * h;
gets = @(i) (i - 1) * h;

K = @(x, s) sin(x)*cos(s) + cos(x)*sin(s);

g1 = @(x) sin(x);
h1 = @(s) cos(s);
g2 = @(x) cos(x);
h2 = @(s) sin(s);

M2 = zeros(N, N);
for i=1:N
	for j=1:N
		intoper(i, j) = edge(j) * K(getx(i), gets(j));
	end
end
operator = eye(N) + eps * intoper;
lambdas = eig(intoper);
%'1 ./ lambdas

num1 = 0.1460;
num2 = -1.3662;

B = zeros(2, 2);
% B(j, k) = <g_j, h_k>
for i=1:N
	B(1, 1) = B(1, 1) + edge(i) * g1(getx(i)) * h1(gets(i));
	B(1, 2) = B(1, 2) + edge(i) * g1(getx(i)) * h2(gets(i));
	B(2, 1) = B(2, 1) + edge(i) * g2(getx(i)) * h1(gets(i));
	B(2, 2) = B(2, 2) + edge(i) * g2(getx(i)) * h2(gets(i));
end
matrix = @(eps) eye(2) + eps * B;

bad_lambda = -1 ./ lambdas(1);
matrix(bad_lambda)
eig(matrix(bad_lambda))
rank(matrix(bad_lambda))