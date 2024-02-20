function optimized_trajectory = optimize_rocket_trajectory()
    rocket = initialize_rocket();
    trajectory = initialize_trajectory();
    
    for t = 1:simulation_duration
        forces = calculate_forces(rocket, trajectory);
        rocket = update_rocket_state(rocket, forces);
        
        if needs_stage_separation(rocket)
            rocket = stage_separation(rocket);
        end
        
        if needs_gravity_turn(rocket)
            rocket = perform_gravity_turn(rocket);
        end
        
        trajectory = update_trajectory(trajectory, rocket);
    end
    
    optimized_trajectory = trajectory;
end