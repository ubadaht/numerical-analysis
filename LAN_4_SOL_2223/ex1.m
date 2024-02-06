clear all
clc

disp('Function 1/x')
%%log(|x|)
I1_exact = log(abs(2)) - log(abs(1))
I1_quad = quad(@fun1,1,2)

err = abs(I1_quad-I1_exact)/I1_exact

N=[4 8 16 32 64 128];
for i=1:length(N)
    I1n = TrapComp(@fun1,1,2,N(i));
    err_1(i) = abs(I1n - I1_exact)/I1_exact;
end

disp('Function sin(x)')
%-cos(x)
I2_exact = -cos(pi) + cos(0)
I2=quad(@fun2,0,pi)

err = abs(I2-I2_exact)/I2_exact

N=[4 8 16 32 64 128];
for i=1:length(N)
    I2n = TrapComp(@fun2,0,pi,N(i));
    err_2(i) = abs(I2n-I2_exact)/I2_exact;
end

% Error table
disp('     N       1/x --- sin(x) ')
disp([ N; err_1; err_2]')