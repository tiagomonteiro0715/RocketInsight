function [best_individual, best_fitness] = GA(func, dim, bounds, pop_size, max_gen)
    % Initialize population
    population = bounds(1) + (bounds(2) - bounds(1)) .* rand(pop_size, dim);
    fitness = arrayfun(@(i) func(population(i,:)), 1:pop_size);
    
    for gen = 1:max_gen
        % Selection - Roulette Wheel Selection
        fitness_sum = sum(fitness);
        probs = fitness / fitness_sum;
        [sorted_probs, sort_index] = sort(probs, 'descend');
        population = population(sort_index(1:pop_size/2), :); % Keep top 50%
        
        % Crossover and Mutation
        for i = 1:2:pop_size
            % Crossover
            if i+1 <= pop_size
                crossover_point = randi([1,dim-1]);
                offspring1 = [population(i,1:crossover_point), population(i+1,crossover_point+1:end)];
                offspring2 = [population(i+1,1:crossover_point), population(i,crossover_point+1:end)];
                population = [population; offspring1; offspring2];
            end
            
            % Mutation
            mutation_chance = 0.1;
            if rand() < mutation_chance
                mutation_point = randi(dim);
                population(i,mutation_point) = bounds(1) + (bounds(2) - bounds(1)) * rand();
            end
        end
        
        % Evaluate
        fitness = arrayfun(@(i) func(population(i,:)), 1:size(population,1))';
        [best_fitness, best_idx] = min(fitness);
        best_individual = population(best_idx, :);
    end
end