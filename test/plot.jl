FactCheck.setstyle(:compact)
FactCheck.onlystats(true)

facts("plot object has correct attributes") do

    p = plot(cl)

    context("plot object attributes") do
        @fact typeof(p.x1)   --> Winston.HalfAxisX
        @fact p.attr[:title] --> "AAPL Close"
    end
end
