using FactCheck, MarketData
FactCheck.setstyle(:compact)
FactCheck.onlystats(true)

facts("last methods takes the first observations") do

    context("defaults to n=1") do
        @fact last(cl).values[1] --> 21.9
    end
  
    context("takes other n values") do
        @fact last(cl, 2).values[1] --> 22.43
    end

end
