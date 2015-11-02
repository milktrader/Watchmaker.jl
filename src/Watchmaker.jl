# VERSION >= v"0.4.0-dev+6521" && __precompile__(true)

using Base.Dates, TimeSeries, UnicodePlots

module Watchmaker

using Base.Dates, TimeSeries, Requests, UnicodePlots

export yahoo, fred,
       plot

###### include ##################

include("timearray.jl")
include("plot.jl")
include("fred.jl")
include("yahoo.jl")

end
