FactCheck.setstyle(:compact)
FactCheck.onlystats(true)

facts("color codes print in REPL") do

    include(Pkg.dir("Watchmaker/src/colors.jl")) # pulls in palette

    context("palette list is intact") do
        @fact typeof(palette)                                  --> Array{ASCIIString,1}
        @fact length(palette)                                  --> 661
        @fact sum([contains(p, "goldenrod") for p in palette]) --> 17
    end
end
