#@require Winston begin

"""
Description

      The plot() method uses the Winston plotting package to generate a line plot.

Usage

      using MarketData
      plot(cl)
      plot(ohlc, 4) # the fourth column ("Close") will be plotted

Method Signature(s)

      plot(t::TimeSeries.TimeArray, n::Int=1)

Details

      The plot() method calls the timeplot() function from the Winston plotting package. A plot is generated in a 
      separate window. It takes a TimeSeries.TimeArray as the first argument. The second argument defines the column 
      to be plotted and defaults to n=1. When the meta field is occupied with a string, it becomes the plot's title.

References

      https://github.com/nolta/Winston.jl

See Also
 
      uplot(x) which plots time series in REPL

"""

function plot(t::TimeSeries.TimeArray, n::Int=1; kwargs...)
    s = t.timestamp
    v = t.values[:,n]
    c = t.colnames[n]
    isa(t.meta, AbstractString) ? m = t.meta :  m = ""
    timeplot(s, v, title=string(m, " ", c); kwargs...)
end
#end # of requires macro block
