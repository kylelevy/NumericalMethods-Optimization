function A = InductorStamp(node1, node2, value, MatSize, freq)

% Calculate stamp val
sL = 1i * 2 * pi * freq * value;

% Expand matrix
MatSize = MatSize + 1;

% Creating a zero matrix
A = zeros(MatSize);

% Using the stamp method to insert values
if (node1 == 0)
    A(MatSize, node2) = 1;
    A(node2, MatSize) = 1;    
elseif (node2 == 0)
    A(MatSize, node1) = -1;
    A(node1, MatSize) = -1;  
else
    A(MatSize, node1) = -1;
    A(node1, MatSize) = -1;
    A(MatSize, node2) = 1;
    A(node2, MatSize) = 1;    
end

A(MatSize, MatSize) = -sL;


end
