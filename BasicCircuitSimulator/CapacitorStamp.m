function A = CapacitorStamp(node1, node2, value, MatSize, freq)

% Calculate sC
sC = 1i * 2 * pi * freq * value;

% Creating a zero matrix
A = zeros(MatSize, MatSize);

% Using the stamp method to insert values
if (node2 == 0)

    A(node1, node1) = sC;

elseif (node1 == 0)

    A(node2, node2) = sC;

else
    A(node1, node1) = sC;
    A(node2, node2) = sC;
    A(node1, node2) = -sC;
    A(node2, node1) = -sC;
end

end