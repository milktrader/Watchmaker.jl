#VERSION >= v"0.4.0-dev+6521" && __precompile__(true)

using Base.Dates, TimeSeries, KernelDensity, Colors

module Watchmaker

using Base.Dates, Requires, TimeSeries, Requests, UnicodePlots, Winston, KernelDensity, Colors

import Base: hist

export yahoo, fred,
       uplot, uhist,
       plot, kplot,
       colors,
       goldenrod, khaki

###### include ##################

include("timearray.jl")
include("uplot.jl")
include("uhist.jl")
include("plot.jl")
include("kplot.jl")
include("colors.jl")
include("fred.jl")
include("yahoo.jl")

end
