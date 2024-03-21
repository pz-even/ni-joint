clc;
clear;
close all;
addpath(genpath('ni-joint'));
%% settings
configs.dir = 'ni-joint';
configs.data = 'data';  
configs.results = 'results';
configs.blur = 'low_light_model.png';
configs.evs = 'low_light_model3.mat';
%% for image deblurring
configs.alpha = 0.1;
configs.beta = 8e-3; 
configs.sigma = 0.4; 
%% for event denoising
configs.dvs_resolution = [260 346];
configs.weight = 0.16;
configs.N = 1;
configs.dx = 1;
configs.dt = 10000;
%% run case
configs.case = 1;
%% input
raw_evs = load(fullfile(configs.dir, configs.data, configs.evs)).events;
blur = readraw(imread(fullfile(configs.dir, configs.data, configs.blur)), 1);
%% processing
[sharp, signals] = processing(blur,raw_evs,configs);
%% save configs
save(fullfile(configs.dir, configs.results, [configs.blur(1:end-4) '_configs.mat']), 'configs');
fprintf('check "results"')