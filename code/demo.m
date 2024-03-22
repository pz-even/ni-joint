clc;
clear;
close all;
addpath(genpath('ni-joint-main'));
%% settings
configs.dir = 'ni-joint-main';
configs.data = 'data';  
configs.results = 'results';
configs.blur = 'keyboard.png';
configs.evs = 'keyboard.mat';
configs.dvs_resolution = [260 346];
%% for image deblurring
configs.alpha = 0.2;
configs.beta = 64e-3; 
configs.sigma = 0.06; 
%% for event denoising
configs.weight = 0.1;
configs.N = 1;
configs.dx = 1;
configs.dt = 10000;
%% run case
configs.case = -1;
%% input
raw_evs = load(fullfile(configs.dir, configs.data, configs.evs)).events;
blur = readraw(imread(fullfile(configs.dir, configs.data, configs.blur)), 1);
%% processing
[sharp, signals] = processing(blur,raw_evs,configs);
%% save configs
save(fullfile(configs.dir, configs.results, [configs.blur(1:end-4) '_configs.mat']), 'configs');
fprintf('check "results"')
