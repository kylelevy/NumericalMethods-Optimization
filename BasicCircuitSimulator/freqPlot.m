function [Magnetude,Phase] = freqPlot(netlist, node)
Magnetude = [];
Phase = [];
for i = 1:100:1000000
    [A, b] = mappNETLIST(netlist, i);
    x = GaussElimPivot(A, b);
    %[xM, xP] = phasor(x); 
    
    Magnetude = [Magnetude, 20*log(abs(x(node))/abs(x(1)))];
    %Phase = [Phase, xP(node)];
end

figure;
semilogx(1:100:1000000, Magnetude);

half_power = max(Magnetude) - 3;
f_3dB = interp1(Magnetude, 1:100:1000000, half_power, 'spline')
%figure;
%semilogx(0:100:1000000, Phase);

end