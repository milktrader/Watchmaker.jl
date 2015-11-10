#@require UnicodePlots begin
"""
Description

      The uplot() method plots a time series in REPL, using the UnicodePlots package.

Usage

      using MarketData
      uplot(cl)
      uplot(ohlc, 4) # the fourth column ("Close") will be plotted

Method Signature(s)

      uplot(t::TimeSeries.TimeArray, n::Int=1)

Details

      UnicodePlots provides simple plots inside of REPL. The uplot() method is a wrapper for the UnicodePlots.lineplot()
      method that takes a TimeSeries.TimeArray as the first argument. The second argument defines the column to be 
      plotted and defaults to n=1.

References

      https://github.com/Evizero/UnicodePlots.jl

See Also

      uhist() which plots a histogram of a time series
      plot() which plots a time series in a separate window
"""

function uplot(t::TimeSeries.TimeArray, n::Int=1)
    s = t.timestamp
    v = t.values[:,n]
    c = t.colnames[n]
    isa(t.meta, AbstractString) ? m = t.meta :  m = ""
    lineplot(s, v, title=string(m, " ", c))
end
#end # of requires macro block
