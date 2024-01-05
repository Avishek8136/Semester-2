DataPoints=[0 1 2 3 -1 -2 -3;0.25 1.25 3.75 8 1 4 9];
Model=findModel(DataPoints);
MSE_1=computeMSE(DataPoints,Model);
disp("Training error MSE is ")
disp(MSE_1);
function Model=findModel(DataPoints)
   [~,n]=size(DataPoints);
   X=ones(n,3);
   X(:,1)=(DataPoints(1,:).^2)';
   X(:,2)=DataPoints(1,:)';
   Y=DataPoints(2,:)';
   Model=pinv(X)*Y;
end
function MSE_1=computeMSE(DataPoints,Model)
   [~,n]=size(DataPoints);
   XYV=zeros(n,1);
   for i=1:n
       XYV(i,1)=Model(1)*(DataPoints(1,i)).^2+Model(2)*(DataPoints(1,i))+Model(3);
   end
     MSE_1=0;
   for i=1:n
       MSE_1=MSE_1+(XYV(i,1)-DataPoints(2,i)).^2;
   end
   MSE_1=MSE_1/n;
end
