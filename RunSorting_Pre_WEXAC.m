recname1 = "a0a5f2f1533d1d9aac8b3c95c36181e2";
MA = MEAAnalysis('/home/labs/rivlinlab/bndolev/TestSorting/experiments_linux.xlsx');
MA.setCurrentRecording('recNames=2019-03-12T13-54-57Retina_Trial4.h5,recFormat=MCH5Recording');
MA.currentDataObj.export2Binary;
MA.currentDataObj.convertLayoutKSort;
