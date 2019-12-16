addpath("/home/labs/rivlinlab/bndolev/matlab_files/kilosort2/CUDA/");
addpath(genpath("/home/labs/rivlinlab/bndolev/matlab_files/NET/"))
parpool;
spmd(1)
    recname1 = "e9f94afd777eed657b7272f8b269164e";
    MA = MEAAnalysis('/home/labs/rivlinlab/bndolev/TestSorting2/experiment_linux2.xlsx');
    MA.setCurrentRecording(strcat('recNames=',recname1,'.bin,recFormat=binaryRecording'));
    MA.getKiloSorting;
end

% bsub -q gpu-medium -gpu "num=1" -eo error.txt -oo out.txt -R "rusage[mem=60000]" "matlab -nodisplay -nosplash < RunSorting_Wexac.m"