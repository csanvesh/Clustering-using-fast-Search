clear all
close all
clc
%%%%
%Asking user to enter data set choice
choice= input('enter 1 for Random CrescentFullMoon data 2 for data set present in IEEE paper 3 for Flame data set :');
if choice==1
    tic
   %calling crescentfullmoon function to generate patterned random data
   data = crescentfullmoon();
   %displaying orginal data set
   scatter(data(:,1), data(:,2), 10, data(:,3),'k');
   axis equal;
   title('Before clustering Crescent & Full Moon');
   %calling process_data function to convert inti [ID1,ID2,Distance] form
   input_data=process_data(data);
   
elseif choice==2
    tic
    %Already data is in processed form
    input_data=load('example_distances.dat');
    
    
elseif choice==3
    tic
    data=load('flame.data');
   %displaying orginal data set
   scatter(data(:,1), data(:,2), 10, data(:,3),'k');
   axis equal;
   title('Before clustering Flame data set');
   %calling process_data function to convert inti [ID1,ID2,Distance] form
   input_data=process_data(data);
   
end
%calling find_distance_matrix to calculate distance matrix for input points
distance_matrix=find_distance_matrix(input_data);
%selecting Average minimum number of neighbours are 2%
percent=2.0;
%finding cut_of_distance and local density
[cut_of_distance,rho]= find_rho(input_data,percent,distance_matrix);
%finding clusters 
find_clusters(input_data,distance_matrix,cut_of_distance,rho);
timeElapsed = toc;
disp('time taken to execute:');
disp(timeElapsed);