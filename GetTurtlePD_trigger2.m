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
clear raw;
%% Calculate trigger onsets
pd = abs(pd);
pd = zscore(double(pd));
time = [1:length(pd)]/20000;
peak_samples = find(pd>1);
X = diff(peak_samples);
w = gausswin(400);
peak_smoothed_samples = filtfilt(w,1,pd);
peak_smoothed_samples = zscore(peak_smoothed_samples(1:length(pd)));
peak_smoothed_samples = find(peak_smoothed_samples>1);
Y = diff(peak_smoothed_samples);


flip_idx = find((Y<55000)&(Y>30))+2;
experiment_idx = find(zscore(X)>50)+2;
trial_idx = find(zscore(X)>2)+2;

flips = [peak_smoothed_samples(1),peak_smoothed_samples(flip_idx)];
flip_ends = [peak_smoothed_samples(flip_idx-2),peak_smoothed_samples(end)];

trials = [peak_samples(1),peak_samples(trial_idx)];
trial_ends = [peak_samples(trial_idx-2),peak_samples(end)];

experiments = [peak_samples(1),peak_samples(experiment_idx)];
experiment_ends = [peak_samples(experiment_idx-2),peak_samples(end)];

flips = unique([flips,trials,experiments]);
flip_ends = unique([flip_ends,trial_ends,experiment_ends]);
experiments = experiments/20000;
experiment_ends = experiment_ends/20000;
trials = trials/20000;
trial_ends = trial_ends/20000;
flips = flips/20000;
flip_ends = flip_ends/20000;

%% Plot triggers
startat = time(10000);
stopat = time(end);
hold on;
reduce_plot(experiments(experiments<stopat&experiments>=startat),ones(length(experiments(experiments<stopat&experiments>=startat)),1).*3,'.g','MarkerSize',60); 
reduce_plot(experiment_ends(experiment_ends<stopat&experiment_ends>=startat),ones(length(experiment_ends(experiment_ends<stopat&experiment_ends>=startat)),1).*3,'.r','MarkerSize',60); 
reduce_plot(trials(trials<stopat&trials>=startat),ones(length(trials(trials<stopat&trials>=startat)),1).*2,'.g','MarkerSize',50); 
reduce_plot(trial_ends(trial_ends<stopat&trial_ends>=startat),ones(length(trial_ends(trial_ends<stopat&trial_ends>=startat)),1).*2,'.','MarkerSize',50); 
reduce_plot(flips(flips<stopat&flips>=startat),ones(length(flips(flips<stopat&flips>=startat)),1).*1.5,'.g','MarkerSize',40); 
reduce_plot(flip_ends(flip_ends<stopat&flip_ends>=startat),ones(length(flip_ends(flip_ends<stopat&flip_ends>=startat)),1).*1.5,'.r','MarkerSize',40); 
% % reduce_plot(peak_samples(peak_samples<stopat&peak_samples>=startat),ones(length(peak_samples(peak_samples<stopat&peak_samples>=startat)),1).*1,'.r','MarkerSize',30); 
reduce_plot(time(time<stopat&time>=startat),pd(time<stopat&time>=startat),'-'); 
set(gca,'YLim',[0,10])
%% Save Results
pathdir = strcat("/Volumes/rivlinlab/bndolev/TestSorting/");
results = loadKSdir(pathdir);
results.flips = flips;
results.trials = trials;
results.experiments = experiments;
results.flip_ends = flip_ends;
results.trial_ends = trial_ends;
results.experiment_ends = experiment_ends;
results.pd = pd;
results.stimulation = {'SP', 'GR','BR','SP','SP','GR','BR','SP','DN','DN'};
results.comments = 'All time units are in seconds';

% 
% %% Plot Spikes on top
yyaxis right
plot(results.st(results.st<stopat&results.st>=startat),results.clu(results.st<stopat&results.st>=startat),'.')
% 
% 
