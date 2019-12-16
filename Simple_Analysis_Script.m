fclose all; clear all; close all; clc;
%% Load Results
load("/Users/noah.dolev/Documents/repos/turtle_spikes.mat")
%% Calculated PSTH
events = [];
stim = 'SP';
selected_dir = 90;
clusters = unique(results.clu);
psth = [];
infos = {"/Users/noah.dolev/Documents/repos/turtle_analysis/infostruct_VS_mrSpots_11_25_2019_1913.mat",...
         "/Users/noah.dolev/Documents/repos/turtle_analysis/infostruct_VS_mrGratings_11_25_2019_1920.mat",...
         "/Users/noah.dolev/Documents/repos/turtle_analysis/infostruct_VS_mrMovingBars_11_25_2019_1934.mat",...
         "/Users/noah.dolev/Documents/repos/turtle_analysis/infostruct_VS_mrSpots_11_25_2019_1942.mat",...
         "/Users/noah.dolev/Documents/repos/turtle_analysis/infostruct_VS_mrSpots_11_25_2019_1956.mat",...
         "/Users/noah.dolev/Documents/repos/turtle_analysis/infostruct_VS_mrGratings_11_25_2019_2006.mat",...
         "/Users/noah.dolev/Documents/repos/turtle_analysis/infostruct_VS_mrMovingBars_11_25_2019_2019.mat",...
         "/Users/noah.dolev/Documents/repos/turtle_analysis/infostruct_VS_mrSpots_11_25_2019_2024.mat",...
         "/Users/noah.dolev/Documents/repos/turtle_analysis/infostruct_VS_mrDenseNoise_11_25_2019_2046.mat",...
         "/Users/noah.dolev/Documents/repos/turtle_analysis/infostruct_VS_mrDenseNoise_11_25_2019_2052.mat",};
mpsth = zeros(length(clusters),100);
counter = 1;
for i=1:length(results.stimulation)
    if results.stimulation{i} == stim
        evtemp = results.trial_ends(results.trials>=results.experiments(i)&results.trials<results.experiment_ends(i));
        evtemp = unique(evtemp);
        if (stim == "GR" || stim == "BR")
            info =  load(infos{i});
            info = info.info_struct;
            directions = info.directions;
            evtemp = evtemp(directions==selected_dir);
        end
        
        for ii=1:length(clusters)
            spikes = results.st(results.clu==clusters(ii));
            spikes = spikes(diff(spikes)>0.17/1000);
            [psth(ii,:), bins, rasterX, rasterY, spikeCounts, binnedArray] = psthAndBA(spikes, evtemp, [-0.5,0.5], 0.01);
        end
        mpsth = mpsth+psth;
        counter = counter+1;
    end
end
mpsth = mpsth/counter;
for i=1:size(mpsth,1)
    mpsth(i,:) = zscore(mpsth(i,:));
end
% mpsth(mpsth<0)=0;
[~,idx]= sort(abs(mean(mpsth(:,find(bins>0,15,'First')),2)-mean(mpsth(:,(bins<-0.1)),2)));
y = 1:size(mpsth,1);
mpsth = mpsth(idx,:);
figure;
imagesc(bins,y,mpsth(idx,:));
figure;
plot(bins,sum(mpsth(idx>600,:),1))
% caxis([0 20])
%% Plot Raster and triggers
% plotclus = clusters(find(zscore(abs(psth(:,find(bins>0,1,'First'))-psth(:,find(bins>0,1,'First')-1)))>2));
% 
% startat = min(results.st);
% stopat = max(results.st);
% 
% t = results.st(results.st<stopat&results.st>=startat);
% chans = results.clu(results.st<stopat&results.st>=startat);
% 
% t = t(ismember(chans,plotclus));
% chans = chans(ismember(chans,plotclus));
% 
% uchan = unique(chans);
% for i=1:length(uchan)
%     chans(chans==uchan(i)) = i;
% end
% 
% figure;
% hold on;
% reduce_plot(results.experiments(results.experiments<stopat&results.experiments>=startat),ones(length(results.experiments(results.experiments<stopat&results.experiments>=startat)),1).*3,'.g','MarkerSize',60); 
% reduce_plot(results.experiment_ends(results.experiment_ends<stopat&results.experiment_ends>=startat),ones(length(results.experiment_ends(results.experiment_ends<stopat&results.experiment_ends>=startat)),1).*3,'.r','MarkerSize',60); 
% reduce_plot(results.trials(results.trials<stopat&results.trials>=startat),ones(length(results.trials(results.trials<stopat&results.trials>=startat)),1).*2,'.g','MarkerSize',50); 
% reduce_plot(results.trial_ends(results.trial_ends<stopat&results.trial_ends>=startat),ones(length(results.trial_ends(results.trial_ends<stopat&results.trial_ends>=startat)),1).*2,'.','MarkerSize',50); 
% reduce_plot(results.flips(results.flips<stopat&results.flips>=startat),ones(length(results.flips(results.flips<stopat&results.flips>=startat)),1).*1.5,'.g','MarkerSize',40); 
% reduce_plot(results.flip_ends(results.flip_ends<stopat&results.flip_ends>=startat),ones(length(results.flip_ends(results.flip_ends<stopat&results.flip_ends>=startat)),1).*1.5,'.r','MarkerSize',40); 
% yyaxis right
% plot(t,chans,'.')
