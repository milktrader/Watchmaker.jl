using FactCheck, MarketData
FactCheck.setstyle(:compact)
FactCheck.onlystats(true)

facts("first methods takes the first observations") do

    context("defaults to n=1") do
        @fact first(cl).values[1] --> 111.94
    end
  
    context("takes other n values") do
        @fact first(cl, 2).values[2] --> 102.5
    end

end
