DataPoints=[0 1 2 3 -1 -2 -3;0.25 1.25 3.75 8 1 4 9];
Model=findModel(DataPoints);
disp("Determined value of y of the modelled graph at x=0.8=")
disp(Model(1)*(0.8).^2+Model(2)*(0.8)+Model(3));
function Model=findModel(DataPoints)
   [~,n]=size(DataPoints);
    X=ones(n,3);
    X(:,1)=(DataPoints(1,:).^2)';
    X(:,2)=DataPoints(1,:)';
    Y=DataPoints(2,:)';
    Model=pinv(X)*Y;
end
