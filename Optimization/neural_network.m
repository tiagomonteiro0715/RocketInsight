function[output] = simple_nn(X, y, iter)
% Initialize theta to random values
theta_one = rand(3, 3);
theta_two = rand(1, 3);

% Assign the transposed input to the input layer (a{1})
a{1} = X;

% loop to carry out gradient descent iter times
for i = 1:iter
    % Forward propagation to calculate output using sigmoid function
    a{2} = 1 ./ (1 + e.^(-theta_one * a{1}));
    a{3} = 1 ./ (1 + e.^(-theta_two * a{2}));
    
    % Back propagation to calculate error
    error_three = a{3} - y';
    error_two = (theta_two' * error_three) .* a{2} .* (1 - a{2});
    
    % Subtract partial derivatives from theta
    theta_one = theta_one - (error_two * a{1}');
    theta_two = theta_two - (error_three * a{2}');
end

output = a{3};

end
