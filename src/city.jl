@kwdef mutable struct City{N}
    position::Tuple{Vararg{Float64, N}}
    name::String
    color::Color
    cargo::Int
    money::Int
end