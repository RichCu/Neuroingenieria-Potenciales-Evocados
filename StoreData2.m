function StoreData2(src, evt, inf)
%n=s.ScansAquired;
global data1
global data2


%tic
tempData= evt.Data;
%tempData=[evt.TimeStamps, evt.Data];
n=src.ScansAcquired;
%p=(n/250)*2;

%p=(n/2000);
%data(:,p-1:p)=tempData;
data1=tempData(:,1);
data2=tempData(:,2);

%data=tempData;
%[cumAvg, n_cum] = cum_avg(tempData', cumAvg, n_cum);
%figure
%plot(evt.Data)
%dlmwrite('experiment_average.csv', cumAvg, '-append');

dlmwrite(inf, tempData');
% s2 = xor(s2, 1);
% [c0, c1, img] = StimulateVision(s2, c0, c1, img, size);
%toc
end