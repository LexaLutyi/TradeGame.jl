using TradeGame
using Documenter

DocMeta.setdocmeta!(TradeGame, :DocTestSetup, :(using TradeGame); recursive=true)

makedocs(;
    modules=[TradeGame],
    authors="Samarin Aleksei <liotbiu1@gmail.com> and contributors",
    repo="https://github.com/LexaLutyi/TradeGame.jl/blob/{commit}{path}#{line}",
    sitename="TradeGame.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://LexaLutyi.github.io/TradeGame.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/LexaLutyi/TradeGame.jl",
    devbranch="main",
)
