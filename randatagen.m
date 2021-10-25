clc, close, clear
%% random data generator

% normal dist random data
n1 = 100;
n2 = 75;
Data1 = randn(n1,1); %Gives the normal dist data with mu=0 and var=1
Data2 = rand(n2,1); %uniform dist data


%% normal dist with specified mue and var

% randn mu and var
sigx2 = 1;
mu1 = 0;

% new sample mu and var
sigy2 = 2; % required var for the new sample data
mu2 = 10; % required mu2 for the new sample data

% Coefficients calculation
a = sqrt(sigy2 ./ sigx2);
b = mu2 - a*mu1;
Data1_y = a*Data1 + b; % New data set with desired mu and var
Data2_y = a*Data2 + b;


%% Visualization

histogram(Data1,"Normalization","pdf")
xlabel("Quantity")
ylabel("Normalized frequency")

hold on
histogram(Data1_y,"Normalization","pdf")
histogram(Data2,"Normalization","pdf")
histogram(Data2_y,"Normalization","pdf")
hold off
legend("Nomrally distributed data","Normally distributed data with specified avg and var"...
    ,"Uniformly distributed data","Uniformly distributed data with specified avg and var")

%% Output

Data1_y = ["Kids ages"; Data1_y] % Adding a header file
writematrix(Data1_y,'Data1_y.csv'); % Save as a csv file (or .txt, .xls, etc.)

