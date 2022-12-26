clearvars;
close all;
disp('!!!!!!')
disp((0.1 + 0.2) + 0.3 == 0.1 + (0.2 + 0.3))
disp('111111')
disp((2^53 + 2) -2 ^ 53 == 2)
disp((2^53 + 1) -2 ^ 53 == 1)
disp((2^53 + 1)  == 2^53)
disp('111111')
disp(0.1 + 0.2 - 0.3)
fprintf('%.20e',0.3)
disp('\\n')
fprintf('%.20e',0.1 + 0.2)