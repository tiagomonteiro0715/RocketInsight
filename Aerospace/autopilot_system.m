function output = pid_controller(setpoint, measured_value, Kp, Ki, Kd)
    persistent prev_error;
    persistent integral;
    
    if isempty(prev_error)
        prev_error = 0;
        integral = 0;
    end
    
    error = setpoint - measured_value;
    integral += error;
    derivative = error - prev_error;
    output = Kp * error + Ki * integral + Kd * derivative;
    prev_error = error;
end