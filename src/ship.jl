@agent Ship ContinuousAgent{2} begin
    color::Color
    target_city::City
    cargo::Int
    money::Int
    rest_timer::Float64
    rested::Bool
end


function ship_step!(ship, model)
    dt = model.dt

    goal = ship.target_city.position
    stop = is_stationary(ship, model.pathfinder)
    
    if stop && ship.rested
        ship.target_city = rand(model.rng, model.world.cities)
        plan_best_route!(ship, [goal], model.pathfinder)
        ship.rested = false
        ship.rest_timer = 3
    elseif !stop && ship.rested
        move_ship!(ship, model)
    elseif stop && !ship.rested
        ship.rest_timer -= dt
        if ship.rest_timer < 0
            ship.rested = true
        end
    else
        move_ship!(ship, model)
    end
end


function move_ship!(ship, model)
    speed = 1.
    dt = model.dt
    move_along_route!(ship, model, model.pathfinder, speed, dt)
end