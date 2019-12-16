fclose all; clear all; close all; clc;
%% Get turtle trigger (photodiode)
recname1 = 'e9f94afd777eed657b7272f8b269164e';
recname2 = 'dc44cd7aa7183673b5e4aeeffa10dc5b';
recname3 = '9e0210533e2f512fa24d42cdf8fda6b6';
recname4 = '28e59bf644e088626677c1628346c28d';
recname5 = 'b42c49bff23f1a75987777e9ccc114a0';
recname6 = 'bcd67003ec781f75081c25c54c8eb414';
recname7 = '1ea94e082f7ccab8df3e22d4a4730340';
recname8 = '6208fca6e0b32f1689ca4ef478fb75dd';
recname9 = '8770a0ac11a01b68f2becdf368d5fbd3';
recname10 = 'd8f84953da7415090d48e24d0015120a';
recname11 = '501d7523cf06f792d540a277690e2a29';
recname12 = '7080c45b2c8e87d65eeb65df41625de5';
recname13 = '5a2583f4fe5c79f091b5e2cbd3d515c7';

recnames = {recname1,recname2,recname3,recname4,recname5,recname6,recname7,recname8,recname9,recname10,recname11,recname12,recname13};
pd = [];

for i = 1:length(recnames)
    fn_full  = "/Volumes/rivlinlab/bndolev/TestSorting/"+recnames{i}+".h5";    
    raw = h5read(fn_full,'/Data/Recording_0/AnalogStream/Stream_0/ChannelData')';
    pd = [pd,raw];
end

%% Calculate trigger onsets
pd = abs(pd);
pd = zscore(double(pd));
time = [1:length(pd)]/20000;
peak_samples = find(pd>1);

flips = peak_samples(find(peak_samples(2:end)-peak_samples(1:end-1) > 20)+1);
trials = flips(find(flips(2:end)-flips(1:end-1) > 41994)+1);
experiments = [peak_samples(1),trials(find(trials(2:end)-trials(1:end-1) > 500000)+1)];

flips = sort(unique([experiments,flips]));
trials = sort(unique([experiments,trials]));

flip_ends = peak_samples(find(peak_samples(2:end)-peak_samples(1:end-1) > 20));
trial_ends = flips(find(flips(2:end)-flips(1:end-1) > 41994));
experiment_ends = [trials(find(trials(2:end)-trials(1:end-1) > 500000)),peak_samples(end)];

flip_ends = sort(unique([experiment_ends,flip_ends]));
trial_ends = sort(unique([experiment_ends,trial_ends]));


flips = flips/20000;
trials = trials/20000;
experiments=experiments/20000;
peak_samples = peak_samples/20000;

flip_ends = flip_ends/20000;
trial_ends = trial_ends/20000;
experiment_ends = experiment_ends/20000;


%% Save Results
pathdir = strcat("/home/labs/rivlinlab/bndolev/TestSorting/");
results = loadKSdir(pathdir);
results.flips = flips;
results.trials = trials;
results.experiments = experiments;
results.flip_ends = flip_ends;
results.trial_ends = trial_ends;
results.experiment_ends = experiment_ends;

results.stimulation = {'GR', 'BR','SP','SP','GR','BR','SP','SP','DN','DN'};
results.comments = 'All time units are in seconds';
save('turtle_spikes.mat','results','-v7.3');
%% Plot triggers
startat = time(10000);
stopat = time(end);
hold on;
plot(experiments(experiments<stopat&experiments>=startat),ones(length(experiments(experiments<stopat&experiments>=startat)),1).*3,'.g','MarkerSize',60); 
plot(experiment_ends(experiment_ends<stopat&experiment_ends>=startat),ones(length(experiment_ends(experiment_ends<stopat&experiment_ends>=startat)),1).*3,'.r','MarkerSize',60); 
plot(trials(trials<stopat&trials>=startat),ones(length(trials(trials<stopat&trials>=startat)),1).*2,'.g','MarkerSize',50); 
plot(trial_ends(trial_ends<stopat&trial_ends>=startat),ones(length(trial_ends(trial_ends<stopat&trial_ends>=startat)),1).*2,'.y','MarkerSize',50); 
plot(flips(flips<stopat&flips>=startat),ones(length(flips(flips<stopat&flips>=startat)),1).*1.5,'.b','MarkerSize',40); 
plot(flip_ends(flip_ends<stopat&flip_ends>=startat),ones(length(flip_ends(flip_ends<stopat&flip_ends>=startat)),1).*1.5,'.b','MarkerSize',40); 
plot(peak_samples(peak_samples<stopat&peak_samples>=startat),ones(length(peak_samples(peak_samples<stopat&peak_samples>=startat)),1).*1,'.r','MarkerSize',30); 
plot(time(time<stopat&time>=startat), pd(time<stopat&time>=startat));

%% Plot Spikes on top
% yyaxis right
% plot(results.st(results.st<stopat&results.st>=startat),results.clu(results.st<stopat&results.st>=startat),'.')


