function [A, b] = mappNETLIST (filename, freq)

% Open the netlist file for reading
fileID = fopen(filename, 'r');

% Define the format of each line in the netlist file
formatSpec = '%s %d %d %f';

% Read the data using textscan
data = textscan(fileID, formatSpec, 'CommentStyle', '#');

% Close the file
fclose(fileID);

% Extract the components and connections
components = data{1};
node1 = data{2};
node2 = data{3};
value = data{4};

% Display the extracted data
% disp('Components:')
% disp(components)
% disp('Node 1:')
% disp(node1)
% disp('Node 2:')
% disp(node2)
% disp('Values:')
% disp(value)

% Finding the size of Matrix A and B
MatSize = max([max(node1), max(node2);]);

% Declaring the matricies
A = zeros(MatSize);
b = zeros(1, MatSize);

% Populating values
numRows = numel(components);

for i = 1:numRows
    if components{i}(1) == 'R'
        % Apply resistor stamp
        A_R = ResistorStamp(node1(i),node2(i),value(i),MatSize);
        
        % Superimpose matrix
        A = A + A_R;

    elseif components{i}(1) == 'I'
        % Apply current stamp
        b_I = CurrentStamp(node1(i),node2(i),value(i),MatSize);

        % Superimpose matrix
        b = b + b_I;

    elseif components{i}(1) == 'V'
        % Apply voltage stamp
        [A_v, b_v] = VoltageStamp(node1(i),node2(i),value(i),MatSize);

        % Expand matrix
        MatSize = MatSize + 1;
        new_row = zeros(1, MatSize-1);
        new_col = zeros(MatSize, 1);
        new_colb = zeros(1);
        A = [A; new_row];
        A = [A new_col];
        b = [b new_colb];

        % Superimpose matrix
        A = A + A_v;
        b = b + b_v;

    elseif components{i}(1) == 'L'
        % Apply voltage stamp
        A_l = InductorStamp(node1(i),node2(i),value(i),MatSize,freq);

        % Expand matrix
        MatSize = MatSize + 1;
        new_row = zeros(1, MatSize-1);
        new_col = zeros(MatSize, 1);
        new_colb = zeros(1);
        A = [A; new_row];
        A = [A new_col];
        b = [b new_colb];

        % Superimpose matrix
        A = A + A_l;

    elseif components{i}(1) == 'C'
        % Apply current stamp
        A_c = CapacitorStamp(node1(i),node2(i),value(i),MatSize, freq);

        % Superimpose matrix
        A = A + A_c;
    end
end

end