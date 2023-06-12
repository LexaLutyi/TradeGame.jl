using TradeGame
using Test
using Agents

@testset "initialize_trade_game" begin
    model = initialize_trade_game(1)

    run!(model, ship_step!, 100)
end
