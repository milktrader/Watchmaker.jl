FactCheck.setstyle(:compact)
FactCheck.onlystats(true)


facts("In REPL plotting wrappers work for histogram") do

    h = hist(cl);

    context("attributes are correct") do
        @fact h.title  --> "AAPL Close"
        @fact h.xlabel --> ""
        @fact h.ylabel --> ""
    end
end
