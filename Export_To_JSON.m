fclose all; clear all; close all; clc;
load("/Users/noah.dolev/Documents/repos/turtle_spikes.mat")
% fileID = fopen('results.json','w');
% fprintf(fileID,savejson();
% fclose(fileID);
savejson('astruct',results,...
            struct('ParseLogical',1),'FileName','results.json');