function [m, a] = gVoltageSweep(A, b)
m = [];
a = [];
mtemp = [];
atemp = [];
% Sweep from -60 to 60 in 0.01 increments.
for i = -60:0.01:60
    b(1,7) = i;
    [mtemp, atemp] = phasor(GaussElimPivot(A,b));
    m = [m mtemp];
    a = [a atemp];
end
end