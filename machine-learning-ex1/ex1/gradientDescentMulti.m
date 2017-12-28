function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);    

for iter = 1:num_iters
  
    

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %
    oldTheta = theta;
    for features = 1:length(theta)    
      Sum = 0;
      for iteration = 1:m
        h = 0;
        h = (oldTheta'*X(iteration,:)');
        
        disp(h);
        disp(y(iteration));
        pause;
        Sum = Sum + ((h - y(iteration))*X(iteration,features)); 
      end      
      theta(features) = oldTheta(features) - ((alpha/m)*Sum);     
    end
    
    % ============================================================

    % Save the cost J in every iteration     
    J_history(iter) = computeCostMulti(X, y, theta);
    
end

end
