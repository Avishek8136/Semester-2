function A()
   DataPoints=[0 1 2 3 -1 -2 -3;0.25 1.25 3.75 8 1 4 9];
   Model=findModel(DataPoints);
   PlotModelWithData(DataPoints,Model);
end
function Model=findModel(DataPoints)
   [~,n]=size(DataPoints);
    X=ones(n,3);
    X(:,1)=(DataPoints(1,:).^2)';
    X(:,2)=DataPoints(1,:)';
    Y=DataPoints(2,:)';
    Model=pinv(X)*Y;
end
function PlotModelWithData(DataPoints,Model)
   scatter(DataPoints(1,:),DataPoints(2,:),"*r")
   MINXV=min(DataPoints(1,:))-1;
   MAXXV=max(DataPoints(1,:))+1;
   XXV=MINXV:0.01:MAXXV;
   XYV=Model(1)*(XXV).^2+Model(2)*(XXV)+Model(3);
   hold on;
   scatter(XXV,XYV,'.b');
end
