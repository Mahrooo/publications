
%%
A_ = A + B*K_x;
B_ = B*K1;
C_ = [1 0 0 0; 0 1 0 0];
D_ = [];
sys = ss(A_,B_,C_,D_);
t = 0:0.01:10;
u = Y*ones(size(t));
x0 = [30; 40; 10; 10];
init_point = plot(x0(1), x0(2) , '*r')
[y,t,x] = lsim(sys, u, t, x0);
path = plot(y(:,1), y(:,2), 'r')
for i = 1:20
    x0 = [[30;40]; rand(2,1)*40 - 20];
    init_point = plot(x0(1), x0(2) , '*r')
    [y,t,x] = lsim(sys, u, t, x0);
    path = plot(y(:,1), y(:,2), 'g')
end
% legend([init_point, path],'x_0', 'path') 
u = K1*Y + K_x * x';
CBF = Ah*A*B*u + K(1)*(Ah*x'+Ab) + K(2)*(Ah*A*x');
