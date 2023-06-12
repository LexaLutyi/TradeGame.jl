city_names = [
    "London"
    "Paris"
    "Moscow"
    "Shenzhen"
    "Amsterdam"
    "New York"
    "Lisbon"
    "Rome"
    "Madrid"
    "Oslo"
]


function initialize_trade_game(seed)
    space_size = (100, 100)
    space2d = ContinuousSpace(space_size; periodic = false)
    walkmap = ones(Bool, space_size) |> BitArray
    for i in 1:space_size[1]
        for j in 1:space_size[2]
            if abs(i - 50) < 40 && abs(j - 50) < 20
                walkmap[i, j] = 0
            end
        end
    end
    rng = Random.MersenneTwister(seed)
    
    properties = (;
        world = World([]),
        pathfinder = AStar(space2d; walkmap, cost_metric=DirectDistance{2}()),
        dt = 1.,
    )
    model = ABM(Ship, space2d; rng, properties)

    n = 10
    colors = distinguishable_colors(n)
    for id in 1:n
        pos = random_walkable(model, model.pathfinder)
        name = city_names[id]
        color = colors[id]
        cargo = 100
        money = 1000
        city = City(pos, name, color, cargo, money)
        push!(model.world.cities, city)
    end
    
    m = 20
    colors = distinguishable_colors(m)
    for i in 1:m
        pos = random_walkable(model, model.pathfinder)
        color = colors[i]
        vel = (0, 0)
        cargo = 0
        money = 1000
        city = rand(model.rng, model.world.cities)
        ship = Ship(
            nextid(model), 
            pos, 
            vel, 
            color,
            city,
            cargo,
            money 
            )
        add_agent_pos!(ship, model)
    end
    
    model
end