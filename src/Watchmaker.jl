#VERSION >= v"0.4.0-dev+6521" && __precompile__(true)

using Base.Dates, TimeSeries, KernelDensity, Colors

module Watchmaker

using Base.Dates, Requires, TimeSeries, Requests, UnicodePlots, Winston, KernelDensity, Colors

import Base: hist, first, last

export yahoo, fred,
       plot, kplot,
       uplot, uhist,
       colors, palette, default_colors 

###### include ##################

include("timearray.jl")
include("fred.jl")
include("yahoo.jl")
include("plot.jl")
include("kplot.jl")
include("uplot.jl")
include("uhist.jl")
include("colors.jl")
include("const.jl")
include("first.jl")
include("last.jl")

end
