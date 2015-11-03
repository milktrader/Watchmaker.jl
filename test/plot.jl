FactCheck.setstyle(:compact)
FactCheck.onlystats(true)

facts("In REPL plotting wrappers work for lineplot") do

    p = plot(cl);

    context("attributes are correct") do
        @fact p.leftLabels[15]  --> "10"
        @fact p.leftLabels[1]   --> "150"
        @fact p.rightLabels[1]  --> "Close"
        @fact p.title           --> "AAPL"
    end
end
