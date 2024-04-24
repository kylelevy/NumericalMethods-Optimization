function A = ResistorStamp(node1, node2, value, MatSize)

% Creating a zero matrix
A = zeros(MatSize, MatSize);

% Using the stamp method to insert values
if (node2 == 0)

    A(node1, node1) = 1/value;

elseif (node1 == 0)

    A(node2, node2) = 1/value;

else
    A(node1, node1) = 1/value;
    A(node2, node2) = 1/value;
    A(node1, node2) = -1/value;
    A(node2, node1) = -1/value;
end

end