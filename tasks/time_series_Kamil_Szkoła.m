%I uploaded the data using import data button and changed its name to covid

%% extracting data for Poland and Norway seperately
pol = covid(string(covid.country)=='Poland',:);
nor = covid(string(covid.country)=='Norway',:);

%using data from 2022
pol = pol( pol.date >= '2022-01-01', :);
nor = nor( nor.date >= '2022-01-01', :);

%We need data for Daily hospital occupancy 
pol = pol(pol.indicator=="Daily hospital occupancy",:);
mean(pol.value) %calcualting mean and std
std(pol.value)
nor = nor(nor.indicator=="Daily hospital occupancy",:);
mean(nor.value) %calcualting mean and std
std(nor.value)


%% absolute growth
absolute_growth_Poland=(pol.value(2:end)-pol.value(1:end-1));
mean(absolute_growth_Poland)
std(absolute_growth_Poland)

absolute_growth_Norway=(nor.value(2:end)-nor.value(1:end-1));
mean(absolute_growth_Norway)
std(absolute_growth_Norway)


% relative growth
relative_growth_Poland=(pol.value(2:end)-pol.value(1:end-1))./pol.value(1:end-1);
mean(relative_growth_Poland)
std(relative_growth_Poland)

relative_growth_Norway=(nor.value(2:end)-nor.value(1:end-1))./nor.value(1:end-1);
mean(relative_growth_Norway)
std(relative_growth_Norway)


% logarithmic growth
loagrithmic_growth_Poland=(log(pol.value(2:end))-log(pol.value(1:end-1)));
mean(loagrithmic_growth_Poland)
std(loagrithmic_growth_Poland)
loagrithmic_growth_Norway=(log(nor.value(2:end))-log(nor.value(1:end-1)));
mean(loagrithmic_growth_Norway)
std(loagrithmic_growth_Norway)


% plotting data
plot(absolute_growth_Poland)
plot(absolute_growth_Norway)
plot(relative_growth_Poland)
plot(relative_growth_Norway)
plot(loagrithmic_growth_Poland)
plot(loagrithmic_growth_Norway)


%% linear trend estimation for Poland
x = datenum(datetime(pol.date));
y = pol.value;
b = polyfit(x,y,1);
fr = polyval(b,x);
Error_pol = round(mse(pol.value, fr));

%plotting data
figure(1);
plot(x, y, '-b');
hold on;
plot(x, fr, '-r');
hold off;
h1 = legend('Data', 'Linear', 'Location','NE');
set(h1, 'FontSize',8);
textposx = diff(xlim)*0.50+min(xlim);
textposy = diff(ylim)*0.95+min(ylim);
text(textposx,textposy, sprintf('y = %.2f*x %c %0.2f', b(1), char(45-(sign(b(1))+1)), abs(b(2))), 'FontSize',8);
xlabel('Years');
ylabel('Values');


%% linear trend estimation for Norway
x_N = datenum(datetime(nor.date));
y_N = nor.value;
b_N = polyfit(x_N,y_N,1);
fr_N = polyval(b_N,x_N);
Error_nor = round(mse(nor.value, fr_N));

%plotting data
figure(1);
plot(x_N, y_N, '-b');
hold on;
plot(x_N, fr_N, '-r');
hold off;
h1 = legend('Data', 'Linear', 'Location','NE');
set(h1, 'FontSize',8);
textposx = diff(xlim)*0.50+min(xlim);
textposy = diff(ylim)*0.95+min(ylim);
text(textposx,textposy, sprintf('y = %.2f*x %c %0.2f', b_N(1), char(45-(sign(b_N(1))+1)), abs(b_N(2))), 'FontSize',8);
xlabel('Years');
ylabel('Values');

%The lowest error is for Norway.


%% smooth data with movemean for k=5 and k=22 Poland
x = datenum(datetime(pol.date));
y = pol.value;

M_pol_5 = movmean(pol.value,5);
Error_pol_5 = round(mse(pol.value, M_pol_5));
plot(x,y,'-o',x,M_pol_5,'-x')
legend('Original Data','Smoothed Data')

M_pol_22 = movmean(pol.value,22);
Error_pol_22 = round(mse(pol.value, M_pol_22));
plot(x,y,'-o',x,M_pol_22,'-x')
legend('Original Data','Smoothed Data')

% The lowest error is for k=5

%% smooth data with movemean for k=5 and k=22 Norway
x_N = datenum(datetime(nor.date));
y_N = nor.value;

M_nor_5 = movmean(nor.value,5);
Error_nor_5 = round(mse(nor.value, M_nor_5));
plot(x_N,y_N,'-o',x_N,M_nor_5,'-x')
legend('Original Data','Smoothed Data')

M_nor_22 = movmean(nor.value,22);
Error_nor_22 = round(mse(nor.value,M_nor_22));
plot(x_N,y_N,'-o',x_N,M_nor_22,'-x')
legend('Original Data','Smoothed Data')

% The lowest error is for k=5


%% estimating for k= {5; 10, 22; 50} and plynomial degree={1,2,3} for the last 100 observations

df = covid(string(covid.indicator)=='Daily hospital occupancy' & covid.date > '2021-12-31', :);
df = sortrows(df,"date","ascend");
df = df(end-100+1:end,:);

%polynomial 1
x_1 = datenum(datetime(df.date));
y_1 = df.value;
b_1 = polyfit(x_1,y_1,1);
fr_1 = polyval(b_1,x_1);
Error_1 = round(mse(df.value, fr_1));

%polynomial 2
x_2 = datenum(datetime(df.date));
y_2 = df.value;
b_2 = polyfit(x_2,y_2,2);
fr_2 = polyval(b_2,x_2);
Error_2 = round(mse(y_2, fr_2));

%polynomial 3
x_3 = datenum(datetime(df.date));
y_3 = df.value;
b_3 = polyfit(x_3,y_3,3);
fr_3 = polyval(b_3,x_3);
Error_3 = round(mse(y_3, fr_3));

% The lowest error is for 2nd degree = 28216508

%  estimating for k = {5; 10, 22; 50}
x_3 = datenum(datetime(df.date));
y_3 = df.value;
M_5 = movmean(y_3,5);
Error_5 = round(mse(y_3,M_5));

M_10 = movmean(y_3,10);
Error_10 = round(mse(y_3,M_10));

M_22 = movmean(y_3,22);
Error_22 = round(mse(y_3,M_22));

M_50 = movmean(y_3,50);
Error_50 = round(mse(y_3,M_50));

%The lowest error is for k=5 which is equal to 25609452
%Conclusion: the best way to approximate is using movmean with k =5
