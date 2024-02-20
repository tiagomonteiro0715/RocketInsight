function pi_estimate = monte_carlo_pi(num_samples)
  inside_circle = 0;
  for i = 1:num_samples
    x = rand();  % Generate a random x coordinate
    y = rand();  % Generate a random y coordinate
    distance = x^2 + y^2;  % Calculate distance from the origin
    if distance <= 1
      inside_circle += 1;  % Check if point is inside the circle
    endif
  endfor
  pi_estimate = 4 * inside_circle / num_samples;  % Estimate of π
endfunction