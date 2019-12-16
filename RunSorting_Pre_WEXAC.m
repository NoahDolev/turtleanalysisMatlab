addpath("/home/labs/rivlinlab/bndolev/matlab_files/kilosort2/CUDA/");
addpath(genpath("/home/labs/rivlinlab/bndolev/matlab_files/NET/"))


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

MA = MEAAnalysis('/home/labs/rivlinlab/bndolev/TestSorting/experiment_linux2.xlsx');
MA.setCurrentRecording(strcat('recNames=',recname1,'.h5&',...
                                          recname2,'.h5&',...
                                          recname3,'.h5&',...
                                          recname4,'.h5&',...
                                          recname5,'.h5&',...
                                          recname6,'.h5&',...
                                          recname7,'.h5&',...
                                          recname8,'.h5&',...
                                          recname9,'.h5&',...
                                          recname10,'.h5&',...
                                          recname11,'.h5&',...
                                          recname12,'.h5&',...
                                          recname13,'.h5'));                                      
MA.currentDataObj.export2Binary;
MA.currentDataObj.convertLayoutKSort;
MA.currentDataObj.convertLayoutJRClust([sqrt(pi*30^2) sqrt(pi*30^2)]);