clear all; clc;close all;

[minValue, exponentForMin] = min_float();
[maxValue, exponentForMax] = max_float();

disp('Minimum representable positive value: ');
disp(minValue);
disp('Exponent for minimum value: ');
disp(exponentForMin);
disp('Maximum representable value: ');
disp(maxValue);
disp('Exponent for maximum value: ');
disp(exponentForMax);

% UNDERFLOW
function [xmin, p] = min_float()
    xmin = 1.0;
    p = 0;
    while (xmin ~= 0) % when there is UNDERFLOW the computer gives 0
        % and continues the computation
        xmin = xmin / 2;
        p = p + 1;
    end
    p = p - 1;
    xmin = 2^(-p);
end

% OVERFLOW
function [xmax, r] = max_float()
    r = 0;
    xmax = 1.0;
    while (xmax ~= inf) % when there is OVERFLOW the computer gives inf
        % and stops the computation
        xmax = 2 * xmax;
        r = r + 1;
    end
    r = r - 1;
    xmax = 2^r;
end
