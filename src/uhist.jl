"""
Description

      The uhist() method plots a histogram of a time series in REPL, using the UnicodePlots package.

Usage

      using MarketData
      uhist(cl)
      uhist(ohlc, 4) # the fourth column ("Close") will be plotted

Method Signature(s)

      uhist(t::TimeSeries.TimeArray, n::Int=1)

Details

      UnicodePlots provides simple plots inside of REPL. The uhist() method is a wrapper for the UnicodePlots.histogram()
      method that takes a TimeSeries.TimeArray as the first argument. The second argument defines the column to be 
      plotted and defaults to n=1.

References

      https://github.com/Evizero/UnicodePlots.jl

See Also
 
      uplot() which plots a lineplot of a time series in REPL
"""

function uhist(t::TimeSeries.TimeArray, n::Int=1)
    v = t.values[:,n]
    c = t.colnames[n]
    isa(t.meta, AbstractString) ? m = t.meta :  m = ""
    ttl = string(m, " ", c)
    histogram(v, title=ttl)
end
