function  MainBayes()
    DataPoints=[161 60 1;162 62 1;158 58 1;159 59 1;161 61 1;150 50 2;152 52 2;151 52 2];
    Label = DataPoints(:,end);
    Data = DataPoints(:,end-1);
end
function ComputePrior(Label)
    NClass= max(Label);
    priorprob=zeros(NClass,1);
    TotSamp=Length(label);
    for i=1:NClass
        priorprob- sum(Label==i)/TotSamp;
    end
end
function Likelyhood=CompleteLabel(Data,Label,XT)
    NClass=max(Label);
     
    for i=1:NClass
        CData=Data(Label==i,:);
        CMean=mean(CData);
        CCov=cov(CData);
        Likelyhood(i)=
    end
end

      