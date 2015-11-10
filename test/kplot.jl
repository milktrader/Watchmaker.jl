using FactCheck
FactCheck.setstyle(:compact)
FactCheck.onlystats(true)

facts("Plot object is a kernel density") do

    context("true things are true") do
        @fact 1 --> 1
    end
  
    context("errors are thrown when expected") do
        @fact_throws find(foo)
    end

    context("pending facts are pending") do
        @pending foo(12) --> "foo"
    end
end
