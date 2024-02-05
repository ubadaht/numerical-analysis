x = 0.5;
while (x+1> 1)
    x = x/2;
end
fprintf('Twice the machine epsilon: %e\n', x * 2);