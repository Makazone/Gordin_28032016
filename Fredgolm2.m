set(0,'defaultAxesFontName', 'SansSerif')
set(0,'defaultTextFontName', 'SansSerif')
hold on;
vn = [];
veps = [];
for N = [2:10:100]
    flag = 1;
    for eps = [2:0.1:14]
        %eps = 10;
        K = @(x,s)x+s;
        f = @(x)x;
        %N = 100;
        h = 1.0/N;
        vx = [0:h:1-h/2];
        vf = f(vx);
        M = zeros(N);
        for k = 1:N
            x = k*h;
            for j = 1:N
                M(k,j) = h*( K(x,j*h) );
            end
            M(k,1) = M(k,1) + h* 1/2.0 * K(x,0);
            M(k,N) = M(k,N) + h* 1/2.0 * K(x,1);
        end
        M = eps * M + eye(N);

        vy = M^(-1) *transpose(vf);
        if min((eig(M))) < 0 && flag == 1
            vn(end + 1) = N
            veps(end + 1)  = eps
            flag = 0;
        end
        plot(vx,vy)
    end
end
hold off;
figure(2)
plot(vn,veps)

