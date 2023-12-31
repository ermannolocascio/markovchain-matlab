clear all
clc
Nmax = 41; % Max number of agents

% Initialize Matrix of agents
OccupancyMatrix = [];

% Start Looping 
for agent = 1:Nmax
    
    
     % Set initial state 
    x0 = randi([0,1]); % 1 = occupied, 0 unoccupied 
    OccupancyList = [];
    OccupancyList = [OccupancyList, x0];

    % Possible sequences of events for Occupied state
    transitionName_occ = ["OO","OU"];
    
    % Possible sequences of events for Unoccupied state
    transitionName_unocc = ["UU","UO"];
    
    i = 0;
    steps = 7*24*6; % Set simulation lenght intended as steps. 

        
        while i ~= steps
            currState = OccupancyList(end);
        
            % Get the x11, x10, x01, x00 for each time step
        
            x11 = randi([0,1]); % use proxy value for now change with the value from the excel
            x10 = 1 - x11; 
            x01 = randi([0,1]); % proxy
            x00 = 1 - x01;
        
            occupiedVect = [x11, x10];
            unoccupiedVect = [x00, x01];
        
            if currState == 1 % occupied 
                randomIndex = randi(numel(occupiedVect));
                % Set pseudo-random number generator. 
                s = RandStream('mlfg6331_64'); % Other options available at https://it.mathworks.com/help/matlab/ref/randstream.html
                % Generate pseudo-random sample given the probabilities
                nextState = randsample(s,transitionName_occ,1,true,occupiedVect);
        
                if nextState == 'OO'
                    OccupancyList = [OccupancyList, 1];  % Occupied
                elseif nextState == 'OU'
                    OccupancyList = [OccupancyList, 0];  % Unoccupied
                end
        
                            
            elseif currState == 0 % unoccupied
                randomIndex = randi(numel(unoccupiedVect));
                % Set pseudo-random number generator. 
                s = RandStream('mlfg6331_64'); % Other options available at https://it.mathworks.com/help/matlab/ref/randstream.html
                % Generate pseudo-random sample given the probabilities
                nextState = randsample(s,transitionName_unocc,1,true,unoccupiedVect);
        
                if nextState == 'UO'
                    OccupancyList = [OccupancyList, 1]; % Occupied
                elseif nextState == 'UU'
                    OccupancyList = [OccupancyList, 0]; % Unoccupied
                end
                        
            end
            i = i + 1;
           
        end

        OccupancyMatrix = [OccupancyMatrix;OccupancyList];

end

S = sum(OccupancyMatrix);

x = 1:length(S);

figure;
bar(x,S);
