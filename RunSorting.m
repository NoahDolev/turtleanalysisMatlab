% recname = '356d6fc2221630be721c4e8bedef0d46';
% MA = MEAAnalysis('\\data.wexac.weizmann.ac.il\\rivlinlab-arc\\h5s\\experiments.xlsx');
% MA.setCurrentRecording(strcat('recNames=',recname,'.h5,recFormat=MCH5Recording'));
% MA.currentDataObj.export2Binary;
% MA.currentDataObj.convertLayoutKSort;
% templayout = MA.currentDataObj.layoutName;
% MA.currentDataObj.convertLayoutJRClust([sqrt(pi*30^2) sqrt(pi*30^2)]);
% MA.setCurrentRecording(strcat('recNames=',recname,'.bin,recFormat=binaryRecording'));
% MA.currentDataObj.layoutName = templayout;
% MA.getKiloSorting;
% MA.getJRClust;
% 
% % manual inspection of the clusters
% jrc('manual',fullfile([MA.currentDataObj.recordingDir,'/', MA.currentDataObj.recordingName,'.prm']));    
% % from the gui: export the qualities of the clusters, to get the
% % annotations (single/multi/noise/...)
% export_gridsorter2(fullfile([MA.currentDataObj.recordingDir,'/', MA.currentDataObj.recordingName,'_res.mat']));

%% Try multifile mode

% recname1 = 'a0a5f2f1533d1d9aac8b3c95c36181e2';
% recname2 = '356d6fc2221630be721c4e8bedef0d46';
% recname3 = '5166139b51819e4a1837b90809405901';
% recname4 = 'cce19c177233ae9fdb66f3cd1e335e5e';
% recname5 = 'd3ec8f0569608740a2217a363394055f';
% recname6 = '56e0f754e2a777f68bd602f56ff2e75b';
% recname7 = '38a709e578bcac26e95014db94d7a8c3';
% recname8 = '816965f639d90236d636ff5418294b0f';
% recname9 = 'f0e4f44db7fe0f1e1691e8ae06972a0a';

% Serena's experiment (191114)
% recname1 = "6abd7d7dd8eb02cc1fea3cf70b19b9fc";
% recname2 = "9156ab5d9adb5deaac22810d436ee7c0";
% recname3 = '6f9a813c109c5b463232c313ec55aab9';
% recname4 = '0032033f9a6261f2da89e2c3ae4e6ec3';
% recname5 = 'd86abc6f5b0f8fa6086f53cbf175c8a7';
% recname6 = '8e8e5f6c3d891770031e3512404a8748';
% recname7 = '64985c53affe373322e7f31fc2212b3f';
% recname8 = '541ab4789ff7d9a11254530faede1819';
% recname9 = '17c05d9d7c391a16e1f2634112b62d62';
% recname10 = '5ee2bb90a9635290209e2011e40dba4d';
% recname11 = 'e769fd29dc10c594ed88fd3721f1100f';
% recname12 = 'a029167de3a48064f6326a5fd11ca384';
% recname13 = 'cb1a59a9239a533a7afaae6c88d662ee';
% recname14 = 'defd86f7497cae026f70c3cebbcdcfa5';
% recname15 = 'd6f292c90ca57e7d320a093be3432b90';
% recname16 = '59edfb60fde464fccb2540f53dc9d5d7';
%%
% Alina (191118)
% recname1 = "0592266c55b81a5a16c7694381f77b1f";
% recname2 = "9266f31b2b645cc590659db42aee50ab";
% done and manually curated on 191122

%% next
% Alina (191122) - should be 5 files
% recname1 = "03899cd8f16a60e7ddf5e2603399f36a";
% recname2 = "2c228c49e5c01613b6d905746c04ed82";
% recname3 = "8f0efbc66e20728c751a422bf4ad7dd9";
% recname4 = "d866b3cc60092cec228302bf4491d89d";
% recname5 = "402541d91bedb6ab04c0fcc84d252954";
% 

%% Serena 191123
% recname1 = "8c72375cc0a7b7b4bf3c587de78865cb";
% recname2 = "d1639bdb584aaec508ae28538db582c4";
% recname3 = "27fa852d4c86128ec35070ffc1fbd6b7";
% recname4 = "eda335fa8c7c801f8ade0789972a5eb4";
% recname5 = "119ed543f306ed116a4a134a86302082";
% recname6 = "17e9793376f670a62bd9d27fb1ac8007";
% recname7 = "958639c31a9aec58005d0a092680459d";
% recname8 = "f9aba69813e997e5998b2641901a6523";
% recname9 = "94813c08ec5b7c279d70bed052e8d1ac";
% recname10= "da90d2c072902aaa6bdab01f7992630c";
% recname11 = "11696c14210c2435488700643c5d3909";
% recname12 = "92e5bfadca22c1d4bc10609ffe6d924c";
% 
%% Noah 191125

% recname1 = "28e59bf644e088626677c1628346c28d";
% recname2 = "e9f94afd777eed657b7272f8b269164e";
% recname3 = "9e0210533e2f512fa24d42cdf8fda6b6";
% recname4 = "b42c49bff23f1a75987777e9ccc114a0";
% recname5 = "dc44cd7aa7183673b5e4aeeffa10dc5b";
% recname6 = "8770a0ac11a01b68f2becdf368d5fbd3";
% recname7 = "bcd67003ec781f75081c25c54c8eb414";
% recname8 = "6208fca6e0b32f1689ca4ef478fb75dd";
% recname9 = "1ea94e082f7ccab8df3e22d4a4730340";
% recname10= "d8f84953da7415090d48e24d0015120a";
% recname11 = "501d7523cf06f792d540a277690e2a29";
% recname12 = "7080c45b2c8e87d65eeb65df41625de5";
% recname13 = "5a2583f4fe5c79f091b5e2cbd3d515c7";

%% Serena 191126 type HistamineCalibration

 recname1 = "c31362486c6fafb5142e8bc208a15353";
 recname2 = "8837de0d52aa2ed82b251574a620a1a0";
 recname3 = "dded0d6d98f9728d3196f29025299032";
 recname4 = "8eb3d313df3b7d831254af26a18fee7c";
 recname5 = "94a6590b7d196464260974ea339235f4";
 recname6 = "b32360f2f131fd70b3f86f28fc5f479e";
 recname7 = "eb8e3e0c846032ab62802b6b901c12b2";
 recname8 = "6d8b86cdd2c3e8aa1dfaaf7b6fa3990c";
 recname9 = "cdcf074e047f9f3e9ec5446e12821c7a";
 recname10= "9d4973241b291e54137186f0834b8489";
 recname11 = "ef253c73049f88782637ab814ffa4140";
 recname12 = "4540b68daadf0a17ee5cd8491dac07a1";
 recname13 = "2d897cda7a254933befa871cf3ee2885";
 recname14 = "a3b903c46619b7c1f43221e6c5111f50";
 recname15 = "e8955ce6f4b74cd15ad5c0a086f7f17e";


%%

MA = MEAAnalysis('\\data.wexac.weizmann.ac.il\\rivlinlab-arc\\h5s\\experiments.xlsx');
MA.setCurrentRecording(strcat('recNames=',...
                              recname1,'.h5&',...
                              recname2,'.h5&', ...
                              recname3,'.h5&', ...
                              recname4,'.h5&', ...
                              recname5,'.h5&',...
                              recname6,'.h5&',...
                              recname7,'.h5&',...
                              recname8,'.h5&',...
                              recname9,'.h5&',...
                              recname10,'.h5&',...
                              recname11,'.h5&',...
                              recname12,'.h5&',...
                              recname13,'.h5&',...
                              recname14,'.h5&',...
                              recname15,'.h5'));  % recname1,'.h5&',...
copyfile("\\data.wexac.weizmann.ac.il\rivlinlab-arc\h5s\layout.chMap", strcat("\\data.wexac.weizmann.ac.il\rivlinlab-arc\h5s\",recname1))
MA.currentDataObj.export2Binary;
MA.currentDataObj.convertLayoutKSort;
% templayout = MA.currentDataObj.layoutName;
MA.currentDataObj.convertLayoutJRClust([sqrt(pi*30^2) sqrt(pi*30^2)]);
MA.setCurrentRecording(strcat('recNames=',recname1,'.bin,recFormat=binaryRecording'));
% MA.currentDataObj.layoutName = templayout;
MA.getDigitalTriggers;
MA.getKiloSorting;
MA.getJRClust;

%% Manually Sort with Phy:
pathdir = strcat("\\data.wexac.weizmann.ac.il\rivlinlab-arc\h5s\", recname1,"\wexac_sorting_1\");
pathdir = strcat("\\data.wexac.weizmann.ac.il\rivlinlab-arc\h5s\", recname1,"\wexac_sorting_2\");
pathdir = strcat("\\data.wexac.weizmann.ac.il\rivlinlab-arc\h5s\", recname1,"\original_windows_sorting\");
pathdir = strcat("\\data.wexac.weizmann.ac.il\rivlinlab-arc\h5s\", recname1,"\new_windows_sorting\");
pathdir = strcat("\\data.wexac.weizmann.ac.il\rivlinlab-arc\h5s\", recname1,"\");
system(strcat("cmd /K ", """C:\Users\bndolev\AppData\Local\Continuum\anaconda3\Scripts\activate.bat C:\Users\bndolev\AppData\Local\Continuum\anaconda3 & phy template-gui ", pathdir,"params.py"""))

% Load results of Phy Sorting
results = loadKSdir(pathdir);
%% Manually Sort with JRC:
jrc('manual',fullfile([MA.currentDataObj.recordingDir,'/', MA.currentDataObj.recordingName,'.prm']));

% after you are done with manual curation and saved the file and unit
% qualities.csv, run this:
export_gridsorter2(fullfile([MA.currentDataObj.recordingDir,'/', MA.currentDataObj.recordingName,'_res.mat']));
