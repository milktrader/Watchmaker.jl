#VERSION >= v"0.4.0-dev+6521" && __precompile__(true)

using Base.Dates, TimeSeries, KernelDensity

module Watchmaker

using Base.Dates, Requires, TimeSeries, Requests, UnicodePlots, Winston, KernelDensity

import Base: hist

export yahoo, fred,
       uplot, uhist,
       plot, kplot

###### include ##################

include("timearray.jl")
include("uplot.jl")
include("uhist.jl")
include("plot.jl")
include("kplot.jl")
include("fred.jl")
include("yahoo.jl")

end
