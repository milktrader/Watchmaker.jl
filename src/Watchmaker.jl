VERSION >= v"0.4.0-dev+6521" && __precompile__(true)

using Base.Dates, TimeSeries

module Watchmaker

using Base.Dates, TimeSeries

export yahoo

###### include ##################

include("yahoo.jl")

end
