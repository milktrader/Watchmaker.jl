# VERSION >= v"0.4.0-dev+6521" && __precompile__(true)

using Base.Dates, TimeSeries

module Watchmaker

using Base.Dates, TimeSeries, Requests

export yahoo, fred

###### include ##################

include("timearray.jl")
include("fred.jl")
include("yahoo.jl")

end
