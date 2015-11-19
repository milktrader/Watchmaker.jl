FactCheck.setstyle(:compact)
FactCheck.onlystats(true)

facts("kplot object has correct attributes") do

    p = kplot(percentchange(cl))

    context("plot attributes are correct") do
        @fact typeof(p.x1)   --> Winston.HalfAxisX
        @fact p.attr[:title] --> "AAPL Close"
    end
end
