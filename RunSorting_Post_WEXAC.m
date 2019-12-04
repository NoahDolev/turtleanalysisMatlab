addpath("/home/labs/rivlinlab/bndolev/matlab_files/kilosort2/CUDA/");
addpath(genpath("/home/labs/rivlinlab/bndolev/matlab_files/NET/"))
parpool;

recname1 = "28e59bf644e088626677c1628346c28d";
MA = MEAAnalysis('/home/labs/rivlinlab/bndolev/TestSorting/experiments_linux.xlsx');
MA.setCurrentRecording(strcat('recNames=',recname1,'.bin,recFormat=binaryRecording'));
MA.getJRClust;