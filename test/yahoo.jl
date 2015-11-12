FactCheck.setstyle(:compact)
FactCheck.onlystats(true)

facts("Unit tests confirm correct algorithm implementation") do

    context("pending facts are pending") do
        @pending foo(12) --> "foo"
    end
end
