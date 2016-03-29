N = 10;
l = 2;
h = l / N;

D = 5;

q = 50;
% stable for q = 4
% unstable for q = 50

f = @(x) (3 - x) .* x;       % initial state

lambda = @(k) -pi^2 * k^2 / 4;
e = @(k, t) exp(sqrt(lambda(k))*t) - exp(-sqrt(lambda(k))*t);
e_norm = 2; % magic
v = @(k, t) e(k, t) / e_norm;

a0 = @(k) integral(@(t) f(t).*conj(v(k, t)), 0, l);   % scalar product of f(t)
and e_k(t)
a = @(k, t) exp((D*lambda(k) + q)*t) * a0(k);

u = zeros(N, 1);
t0 = 0.75;
for k = 1:70
        for i = 1:N
                    x = (i - 1) / (N - 1) * l;
                    u(i) = u(i) + a(k, t0) * v(k, x);
                end
            end
            plot(u);
