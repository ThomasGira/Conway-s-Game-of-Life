function neighbors = calc_neighbors(world)
    [m , n] = size(world);
    neighbors = zeros(m,n);
    for i = 1:m
        for j = 1:n
            if i > 1 && i < m && j > 1 && j < n   %Free space
                neighbors(i,j) = world(i-1,j-1) + world(i-1,j) + world(i-1,j+1) + ...
                      world(i,j-1) + world(i, j+1) + ...
                      world(i+1,j-1) + world(i+1,j) + world(i+1,j+1);
            elseif (i == 1 && j == 1) %Bottom left
                neighbors(i,j) = world(i,j+1) + world(i+1,j+1) + world(i+1,j);
            elseif i==1 && j==n %Bottom right
                neighbors(i,j) = world(i,j-1) + world(i+1,j-1) + world(i+1,j);
            elseif (i == m && j == 1) %Top left
                neighbors(i,j) = world(i,j+1) + world(i-1,j+1) + world(i-1,j);
            elseif i==m && j==n %Top right
                neighbors(i,j) = world(i,j-1) + world(i-1,j-1) + world(i-1,j);
            elseif i==1 && (j ~= 1 && j ~= n) %Bottom row
                neighbors(i,j) = world(i,j-1) + world(i+1,j-1) + world(i+1,j)...
                    + world(i+1,j+1) + world(i,j+1);
            elseif i==m && (j ~= 1 && j ~= n) %Top row
                neighbors(i,j) = world(i,j-1) + world(i-1,j-1) + world(i-1,j)...
                    + world(i-1,j+1) + world(i,j+1);
            elseif j==1 && (i ~= 1 && i ~= m) %Left row
                neighbors(i,j) = world(i,j+1) + world(i-1,j+1) + world(i-1,j)...
                    + world(i+1,j+1) + world(i+1,j);
            elseif j==n && (i ~= 1 && i ~= m) %Right row
                neighbors(i,j) = world(i,j-1) + world(i-1,j-1) + world(i-1,j)...
                    + world(i+1,j-1) + world(i+1,j);
            end
        end
    end                            
end

    