
clear all;
clc;
load('gen8.mat')
load('gen9.mat')
load('gen10.mat')
load('imp8.mat')
load('imp9.mat')
load('imp10.mat')

performance_plot1(gen8,imp8,gen9,imp9,gen10,imp10)