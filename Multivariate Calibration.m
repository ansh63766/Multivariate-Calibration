clear all
clc

load 'Inorfull';

%% Data preprocessing

Ysample = zeros(26, 176);
StdAvg = zeros(26, 176);
ConcAvg = zeros(26, 3);

for i = 1:26
    start_index = 5*(i-1)+1;
    end_index = start_index + 4;
    Ysample(i, :) = DATA(start_index, :);
    StdAvg(i, :) = mean(stdDATA(start_index:end_index, :), 1)/sqrt(5);
    ConcAvg(i, :) = mean(CONC(start_index:end_index, :), 1);
end

disp('The sample data is: ');
disp(Ysample);
disp('\n');
disp('Concentration data is: ');
disp(ConcAvg);
disp('\n');
%% Part A

figure();
set(gcf, 'Name', 'Comparison of PureNi, PureCo, and PureCr');
plot(PureNi);
hold on;
plot(PureCo);
plot(PureCr);
hold off;
legend('PureNi', 'PureCo', 'PureCr');
xlabel('CONC');
ylabel('Absorbance');
title('Comparison of PureNi, PureCo, and PureCr');
grid on;

[maxValue_1, maxIndex_1] = max(PureNi);
[maxValue_2, maxIndex_2] = max(PureCr);
[maxValue_3, maxIndex_3] = max(PureCo);

% Data for multilinear regression
YsampleMLR = [Ysample(:, maxIndex_1) Ysample(:, maxIndex_2) Ysample(:, maxIndex_3)];

% Multilinear regression on individual samples
BsampleMLR = inv(YsampleMLR'*YsampleMLR)*YsampleMLR'*ConcAvg;
RMSEsampleMLR = norm(ConcAvg - YsampleMLR*BsampleMLR);

RMSE_by_LOOCV = LOOCV_OLS(YsampleMLR, ConcAvg);

disp('RMSE by LOOCV for OLS: ');
disp(RMSE_by_LOOCV);
disp('\n');

%% Part B

nPC = 10;
RMSE_for_PCR = zeros(10, 3);
for i = 1:nPC
    RMSE_for_PCR(i, :) = LOOCV_PCR(Ysample, ConcAvg, i);
end

PRESS_PCR = sum(RMSE_for_PCR, 2);
figure();
set(gcf, 'Name', 'PRESS PCR');
plot(PRESS_PCR);
title('PRESS PCR');

disp('RMSE by LOOCV for PCR: ');
disp(RMSE_for_PCR);
disp('\n');

disp('PRESS by LOOCV for PCR: ');
disp(PRESS_PCR);
disp('\n');


%% Part C

figure();
set(gcf, 'Name', 'Average standard deviations');
plot(StdAvg');
title('Average standard deviations');
ylabel('sigma');
xlabel('i');

stds = mean(StdAvg); % Assuming variation only along wavelength not mixture

L = diag(stds);
Y_scaled = Ysample * inv(L); % scaling

RMSE_for_SPCR = zeros(10, 3);
for i = 1:nPC
    RMSE_for_SPCR(i, :) = LOOCV_PCR(Y_scaled, ConcAvg, i);
end

PRESS_Scaled = sum(RMSE_for_SPCR, 2);

figure();
set(gcf, 'Name', 'PRESS Scaled');
plot(PRESS_Scaled);
title('PRESS Scaled');

disp('RMSE by LOOCV for SPCR: ');
disp(RMSE_for_SPCR);
disp('\n');

disp('PRESS by LOOCV for SPCR: ');
disp(PRESS_Scaled);
disp('\n');

%% Part D

RMSE_for_MLPCR = zeros(10,3);
for nPC = 1:10
    disp(['Loop for nPC = ', num2str(nPC), ' started']);
    RMSE_for_MLPCR(nPC, :) = LOOCV_MLPCR(Ysample, ConcAvg, StdAvg, nPC);
end

PRESS_MLPCR = sum(RMSE_for_MLPCR, 2);

figure();
set(gcf, 'Name', 'PRESS MLPCR');
plot(PRESS_MLPCR);
title('PRESS MLPCR');

disp('RMSE by LOOCV for MLPCR: ');
disp(RMSE_for_MLPCR);
disp('\n');

disp('PRESS by LOOCV for MLPCR: ');
disp(PRESS_MLPCR);
disp('\n');