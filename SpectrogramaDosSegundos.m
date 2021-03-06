data=csvread('4ET4size10NE_uno.csv');
fs=500;
NumEstim=10;
totalSamples=length(data);
dt=1/fs;
TimeVECT=(dt:dt:totalSamples/fs);
plot(TimeVECT,data)
SMatrix=zeros(NumEstim, 3);
spectrogram(data(1,1:1000),1000,2,[1:1:50],500,'yaxis')
figure
spectrogram(data(1,1001:3000),2000,2,[1:1:50],500,'yaxis')

for i=1:1:NumEstim 
    cont=i*3000;
    if i==1
    estimDATA=data(1,cont-1999:cont);
    blackDATA=data(1,cont-2999:cont-2000);
    else
    estimDATA=[estimDATA, data(1,cont-1999:cont)]; 
    blackDATA=[blackDATA, data(1,cont-2999:cont-2000)];
    end
end

[spec_raw1, fspec1, tspec1]=spectrogram(estimDATA,2000,2,[1:1:50],500,'yaxis');
abs_spec_raw1=abs(spec_raw1); 


del_the1=abs_spec_raw1((1:7),:);      % Separaci�n manal por bandas de EEG (delta+teta/alfa/beta) 
alpha1=abs_spec_raw1((8:13),:);
betha1=abs_spec_raw1((14:31),:);

[spec_raw2, fspec2, tspec2]=spectrogram(blackDATA,1000,2,[1:1:50],500,'yaxis');
abs_spec_raw2=abs(spec_raw2); 


del_the2=abs_spec_raw2((1:7),:);      % Separaci�n manal por bandas de EEG (delta+teta/alfa/beta) 
alpha2=abs_spec_raw2((8:13),:);
betha2=abs_spec_raw2((14:31),:);



clasificador_array=zeros(6,(NumEstim));

for i=1:1:(NumEstim)
    del_prom=mean(del_the1(:,i));     % Al tener varias ventas (en el tiempo) se hace el valor promedio de la se�al y se guarda en
    alp_prom=mean(alpha1(:,i));       % el vector de datos clasificador_array que contenia puros ceros
    bet_prom=mean(betha1(:,i));
    
    
    if i<11
    del_prom2=mean(del_the2(:,i));    
    alp_prom2=mean(alpha2(:,i));       
    bet_prom2=mean(betha2(:,i));
    clasificador_array(4,i)=del_prom2;
    clasificador_array(5,i)=alp_prom2;
    clasificador_array(6,i)=bet_prom2;
    end
    
    clasificador_array(1,i)=del_prom;
    clasificador_array(2,i)=alp_prom;
    clasificador_array(3,i)=bet_prom;
    
    
end


