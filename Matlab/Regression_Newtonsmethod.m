function Regression_Newtonsmethod()
    n = input('Please enter value for n: ');
    DataPoints = [rand(2, n)];

    
    Point=[0 ; 1];
    W = NewtonsMethod(f, Point);
    disp('Final regression model:');
    disp(W);
    PlotMyModelAndData(DataPoints, W);
end

function PlotMyModelAndData(DataPoints, Model)
    scatter(DataPoints(1,:), DataPoints(2,:), '*r');
    MinXV = min(DataPoints(1,:)) - 1;
    MaxXV = max(DataPoints(1,:)) + 1;
    XV = MinXV:0.01:MaxXV;
    Model(2)
    YV = Model(1) * XV + Model(2);
    hold on;
    scatter(XV, YV, '.b');
end

function H = HermitionMatrix(DataPoints)
    [~, N] = size(DataPoints);
    syms m c;
    symbol = [m, c];
    f = 0; % Initialize f as a symbolic variable
    
    for i = 1:N
        f = f + (DataPoints(2, i) - (m * DataPoints(1, i) + c)).^2;
    end
    
    H = sym('H', [N, N]); % Initialize H as a symbolic matrix
    
    count1 = 1;
    count2 = 1;
    
    for S1 = symbol
        count2 = 1; % Reset count2 for correct column indexing
        
        for S2 = symbol
            H(count1, count2) = diff(diff(f, S1), S2);
            count2 = count2 + 1;
        end
        
        count1 = count1 + 1;
    end
    
    W = H; % Assign H to W (if needed)
end


function H = DeltaMatrix(DataPoints)
    [~, N] = size(DataPoints);
    syms m c;
    symbol = [m, c];
    f = 0; % Initialize f as a symbolic variable
    
    for i = 1:N
        f = f + (DataPoints(2, i) - (m * DataPoints(1, i) + c)).^2;
    end
    
    count = 1;
    H = sym('H', [N, 1]); % Initialize H as a symbolic matrix
    
    for S = symbol
        H(count, 1) = diff(f, S);
        count = count + 1;
    end
end


function W = NewtonsMethod(DataPoints, Point)
    [~, N] = size(DataPoints);
    syms m c;
    f=0;
    for i=1:N
        f = f+ (DataPoints(2,i)- (m*DataPoints(1,i)+c)).^2;
    end
    condition = true;
    
    while condition
        for i = 1:N
            prev = Theta(1) * DataPoints(1, i) + Theta(2);
            JM = JM + (DataPoints(2, i) - prev) * (-DataPoints(1, i));
            JC = JC + (DataPoints(2, i) - prev) * (-1);
        end

        J = [(2 / N) * JM; (2 / N) * JC];
        Theta = Theta - Alpha * J

        if norm(J) < 0.001
            condition = false;
        end
    end
    
    W = Theta;
end
