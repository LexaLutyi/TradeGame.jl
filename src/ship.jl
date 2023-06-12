@agent Ship ContinuousAgent{2} begin
    color::Color
    target_city::City
    cargo::Int
    money::Int
end


function ship_step!(ship, model)
    speed = 1.
    dt = model.dt

    goal = ship.target_city.position
    
    
    if is_stationary(ship, model.pathfinder)
        ship.target_city = rand(model.rng, model.world.cities)
        plan_best_route!(ship, [goal], model.pathfinder)
    else
        move_along_route!(ship, model, model.pathfinder, speed, dt)
    end
end