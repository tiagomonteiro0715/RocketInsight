% 1. Length Conversion
function feet = meters_to_feet(meters)
    feet = meters * 3.281;
end

function meters = feet_to_meters(feet)
    meters = feet * 0.305;
end

% 2. Mass Conversion
function pounds = kilograms_to_pounds(kilograms)
    pounds = kilograms * 2.205;
end

function kilograms = pounds_to_kilograms(pounds)
    kilograms = pounds * 0.454;
end

% 3. Velocity Conversion
function mph = meters_per_second_to_mph(m_per_s)
    mph = m_per_s * 2.237;
end

function m_per_s = mph_to_meters_per_second(mph)
    m_per_s = mph * 0.447;
end

% 4. Temperature Conversion
function fahrenheit = celsius_to_fahrenheit(celsius)
    fahrenheit = (celsius * 1.8) + 32;
end

function celsius = fahrenheit_to_celsius(fahrenheit)
    celsius = (fahrenheit - 32) * 5/9;
end

% 5. Pressure Conversion
function psi = pascals_to_psi(pascals)
    psi = pascals * 0.000145;
end

function pascals = psi_to_pascals(psi)
    pascals = psi * 6895;
end

% 6. Force Conversion
function pound_force = newtons_to_pound_force(newtons)
    pound_force = newtons * 0.225;
end

function newtons = pound_force_to_newtons(pound_force)
    newtons = pound_force * 4.448;
end