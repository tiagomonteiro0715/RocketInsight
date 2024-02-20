function [gbest, gbest_val] = PSO(func, dim, bounds, num_particles, max_iter)
    % Initialize the particles
    position = bounds(1) + (bounds(2) - bounds(1)) .* rand(num_particles, dim);
    velocity = zeros(num_particles, dim);
    pbest = position;
    pbest_val = arrayfun(@(i) func(position(i,:)), 1:num_particles);
    [gbest_val, gbest_idx] = min(pbest_val);
    gbest = pbest(gbest_idx, :);
    
    % PSO parameters
    c1 = 2; % Cognitive parameter
    c2 = 2; % Social parameter
    w = 0.9; % Inertia weight
    
    % Optimization loop
    for iter = 1:max_iter
        for i = 1:num_particles
            % Update velocity
            velocity(i,:) = w * velocity(i,:) ...
                          + c1 * rand() * (pbest(i,:) - position(i,:)) ...
                          + c2 * rand() * (gbest - position(i,:));
            % Update position
            position(i,:) = position(i,:) + velocity(i,:);
            % Boundary condition handling
            position(i,:) = max(position(i,:), bounds(1));
            position(i,:) = min(position(i,:), bounds(2));
            
            % Evaluate
            current_val = func(position(i,:));
            if current_val < pbest_val(i)
                pbest_val(i) = current_val;
                pbest(i,:) = position(i,:);
                if current_val < gbest_val
                    gbest_val = current_val;
                    gbest = position(i,:);
                end
            end
        end
        
        w = w * 0.95; % Decrease inertia weight
    end
end