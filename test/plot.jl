using FactCheck, MarketData
FactCheck.setstyle(:compact)
FactCheck.onlystats(true)

println("")

facts("In REPL plotting wrappers work") do

    p = plot(cl);

    context("attributes are correct") do
        @fact p.leftLabels[15]  --> "10"
        @fact p.leftLabels[1]   --> "150"
        @fact p.rightLabels[1]  --> "Close"
        @fact p.title           --> ""
    end
end

println("")
