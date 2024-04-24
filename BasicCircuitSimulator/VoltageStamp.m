function [A,b] = VoltageStamp(node1, node2, value, MatSize)

% Expand Matrix
MatSize = MatSize + 1;

% Creating a zero matrix
A = zeros(MatSize);
b = zeros(1, MatSize);

% Using the stamp method to insert values
if (node2 == 0)

    A(MatSize, node1) = -1;
    A(node1, MatSize) = -1;

elseif (node1 == 0)

    A(MatSize, node2) = 1;
    A(node2, MatSize) = 1;

else
    A(MatSize, node1) = -1;
    A(node1, MatSize) = -1;
    A(MatSize, node2) = 1;
    A(node2, MatSize) = 1;
end
    b(MatSize) = value;
end