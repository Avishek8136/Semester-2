function linReg()
Datapoints = [-1 -2 -1 -2 1 1 2 2;
    -1 -1 -2 -2 1 2 1 2] 
Theta = findmodel(Datapoints);
PlotMyModelAndData(Datapoints,Theta);
end
function model=findmodel(Datapoints)
[m n] = size(Datapoints);
x=ones(n,m);
x(:,1)=Datapoints(1,:);
y=Datapoints(:,2);
Model=pinv(x)*y;
end
function PlotMyModelAndData(DP,Model)
Scatter(DP(1,:),DP(2,:),'*r');
MinXV=min(DP(1,:))-1;
MaxXV=max(DP(1,:))+1;
XV=MinXV:0.01:MaxXV;
YV=Model(1)*XV+Model(2);
holdon;scatter(XV,YV,'.b');
end