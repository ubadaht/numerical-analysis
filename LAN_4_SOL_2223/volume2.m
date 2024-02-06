clear all
clc

sweep

volume_quad= pi*quad(@funz2,-5,5)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=-5:0.1:5;
y=funz2(x);
volume_trap= pi*trapz(x,y)