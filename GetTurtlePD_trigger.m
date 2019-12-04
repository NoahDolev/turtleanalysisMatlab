% Get turtle trigger (photodiode)
recname1 = "28e59bf644e088626677c1628346c28d";
recname2 = "e9f94afd777eed657b7272f8b269164e";
recname3 = "9e0210533e2f512fa24d42cdf8fda6b6";
recname4 = "b42c49bff23f1a75987777e9ccc114a0";
recname5 = "dc44cd7aa7183673b5e4aeeffa10dc5b";
recname6 = "8770a0ac11a01b68f2becdf368d5fbd3";
recname7 = "bcd67003ec781f75081c25c54c8eb414";
recname8 = "6208fca6e0b32f1689ca4ef478fb75dd";
recname9 = "1ea94e082f7ccab8df3e22d4a4730340";
recname10= "d8f84953da7415090d48e24d0015120a";
recname11 = "501d7523cf06f792d540a277690e2a29";
recname12 = "7080c45b2c8e87d65eeb65df41625de5";
recname13 = "5a2583f4fe5c79f091b5e2cbd3d515c7";

recnames = {recname1,recname2,recname3,recname4,recname5,recname6,recname7,recname8,recname9,recname10,recname11,recname12,recname13};
pd = [];
for i = 1:length(recnames)
    fn_full  = "\\data.wexac.weizmann.ac.il\rivlinlab-arc\h5s\"+recnames{i}+"\"+recnames{i}+".h5";    
    raw = h5read(fn_full,'/Data/Recording_0/AnalogStream/Stream_0/ChannelData')';
    pd = [pd,zscore(double(raw))];
end

dy = gradient(pd, mean(diff(pd)));
peak_samples = find(dy>4E7);
peak_samples = peak_samples(diff(peak_samples)>3);

stopat = 1000000;
plot(peak_samples(peak_samples<stopat)/20000,ones(length(peak_samples(peak_samples<stopat)),1).*0.3,'.r'); hold on;
plot([1:stopat]/20000, pd(1:stopat));
yyaxis right
plot(results.st(results.st<stopat/20000),results.clu(results.st<stopat/20000),'.')
% [dypks,ix] = findpeaks(dy, 'MinPeakDistance',20, 'MinPeakHeight',1E7);







