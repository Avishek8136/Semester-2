function findmc()
    syms  a b c x ;
    a = input('please enter a value :');
    b = input('please enter b value :');
    c = input('please enter a value :');
    coeficients=[a b c];
    MinXV=-100-1;
    MaxXV=100+1;
    XV=MinXV:0.01:MaxXV;
    YV=a*XV.^2+b*XV+c;
    scatter(XV,YV,'.b');
    R=[0;0]
    findRegModel(coeficients,R)
end
function W=findRegModel(C,R)
    [N,~]=size()
