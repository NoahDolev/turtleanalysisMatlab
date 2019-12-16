addpath("/home/labs/rivlinlab/bndolev/matlab_files/kilosort2/CUDA/");
addpath(genpath("/home/labs/rivlinlab/bndolev/matlab_files/NET/"))
parpool;

recname1 = "e9f94afd777eed657b7272f8b269164e";
MA = MEAAnalysis('/home/labs/rivlinlab/bndolev/TestSorting2/experiment_linux2.xlsx');
MA.setCurrentRecording(strcat('recNames=',recname1,'.bin,recFormat=binaryRecording'));
MA.getJRClust;