using FactCheck, MarketData
FactCheck.setstyle(:compact)
FactCheck.onlystats(true)

facts("Unit tests confirm correct algorithm implementation") do

    p = plot(cl, op)

    context("plot object attributes") do
        @fact typeof(p.x1)   --> Winston.HalfAxisX
        @fact p.attr[:title] --> "AAPL Close"
    end
end
