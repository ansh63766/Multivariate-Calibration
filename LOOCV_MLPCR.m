function RMSE = LOOCV_MLPCR(Ysample, ConcAvg, StdAvg, k)
    [nsamples, nspecies] = size(ConcAvg);
    RMSE = zeros(1, nspecies);

    for i = 1:nsamples
        Xsub = [Ysample(1:i-1, :); Ysample(i+1:end, :)]; 
        Ysub = [ConcAvg(1:i-1, :); ConcAvg(i+1:end, :)]; 
        stdsub = [StdAvg(1:i-1, :); StdAvg(i+1:end, :)]; 

        [U, S, V] = MLPCA(Xsub, stdsub, k);

        V1 = V(:, 1:k);
        Tsub = Xsub * V1;

        % Estimate MLPCR model parameters
        B = inv(Tsub' * Tsub) * Tsub' * Ysub;
        % Diagonal matrix containing variance of errors for sample i
        Sinv = inv(diag(StdAvg(i, :)));
        % Prediction for left-out sample
        tpred = Ysample(i, :) * Sinv * V1 * inv(V1' * Sinv * V1);
        % Prediction error for left-out sample
        prederr = ConcAvg(i, :) - tpred * B;
        RMSE = RMSE + prederr .* prederr;
    end
    % Compute RMSE for each choice of the number of principal components
    RMSE = sqrt(RMSE / nsamples);
end


