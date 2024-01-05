random_uniform = rand(1, 1000);
random_normal = normrnd(0, 1, 1, 1000);

a = 5;
b = 10;
random_v = a + (b - a) * random_uniform;

mean_y = 5;
std_y = 10;
random_y = mean_y + std_y * random_normal;

theoretical_mean_v = (a + b) / 2;
theoretical_variance_v = ((b - a)^2) / 12;
theoretical_skewness_v = 0;
theoretical_kurtosis_v = -6 / 5;

disp("Theoretical mean for Uniform Distribution")
disp("theoretical Mean = "+ theoretical_mean_v)
disp("theoretical Variance = "+theoretical_variance_v)
disp("theoretical Skewnwess = "+theoretical_skewness_v)
disp("theoretical Kurtosis = "+theoretical_kurtosis_v)

theoretical_mean_y = mean_y;
theoretical_variance_y = std_y^2;
theoretical_skewness_y = 0;
theoretical_kurtosis_y = 0;

disp(newline)
disp("Theoretical mean for  Distribution")
disp("theoretical Mean = "+ theoretical_mean_y)
disp("theoretical Variance = "+theoretical_variance_y)
disp("theoretical Skewnwess = "+theoretical_skewness_y)
disp("theoretical Kurtosis = "+theoretical_kurtosis_y)

sample_mean_v = mean(random_v);
sample_variance_v = var(random_v, 1); 
sample_skewness_v = skewness(random_v);
sample_kurtosis_v = kurtosis(random_v) - 3;

disp(newline)
disp("Sample mean for Uniform Distribution")
disp("Sample Mean = "+ sample_mean_v)
disp("Sample Variance = "+sample_variance_v)
disp("Sample Skewnwess = "+sample_skewness_v)
disp("Sample Kurtosis = "+sample_kurtosis_v)

sample_mean_y = mean(random_y);
sample_variance_y = var(random_y, 1); 
sample_skewness_y = skewness(random_y);
sample_kurtosis_y = kurtosis(random_y) - 3;

disp(newline)
disp("Sample Mean for Normal Distribution")
disp("Sample Mean = "+ sample_mean_y)
disp("Sample Variance = "+sample_variance_y)
disp("Sample Skewnwess = "+sample_skewness_y)
disp("Sample Kurtosis = "+sample_kurtosis_y)


