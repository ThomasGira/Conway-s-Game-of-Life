clc
clear
close all
%% 0 - Grid Constants
Lx= .5;                             % plate width (m)
Ly= .5;                             % plate length (m)
Nx= 150;                             % number of nodes in x direction
Ny= 150;                             % number nodes in y direction

dx=Lx/Nx;                           % delta x
dy=Ly/Ny;                           % delta y

World=round(rand(Nx+1,Ny+1));
%% 1 - Plotting section
    x=zeros(1,Nx+1);
    y=zeros(1,Ny+1);            %Generate the plate

    image(World,'CDataMapping','scaled')
    cmap = [1,1,1;0,0,0];
    colormap(cmap);
    caxis([0 1]);

    
%% 2 - Game
while sum(sum(World)) ~= 0
    neighbors = calc_neighbors(World);
    for i = 1:Ny+1
        for j = 1:Nx+1
            if World(i,j) ==1
                if neighbors(i,j) <2 
                    World(i,j) = 0;
                elseif neighbors(i,j) == 2  || neighbors(i,j) == 3 
                    World(i,j) = 1;
                elseif neighbors(i,j) > 2 
                    World(i,j) = 0;
                end
            elseif World(i,j) == 0
                if neighbors(i,j) ==3
                    World(i,j) = 1;
                end
            end
        end
    end
    image(World,'CDataMapping','scaled')
    pause(.1)
    drawnow
end
