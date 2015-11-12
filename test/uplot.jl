using MarketData
FactCheck.setstyle(:compact)
FactCheck.onlystats(true)

facts("In REPL plotting wrappers work for lineplot") do

    p = uplot(cl);

    context("plot size as expected") do
        @fact p.leftLabels[15]  --> "10"
        @fact p.leftLabels[1]   --> "150"
    end

    context("annotations are as expected") do
        @fact p.title           --> "AAPL Close"
    end
end
