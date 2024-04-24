function b = CurrentStamp(node1, node2, value, MatSize)

% Creating a zero matrix
b = zeros(1, MatSize);

% Using stamp method to insert values
if (node1 == 0)

    b(node2) = value;

elseif (node2 == 0)

    b(node1) = -value;

else

    b(node1) = value;
    b(node2) = -value;

end

end