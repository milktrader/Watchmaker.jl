"""
Description

        The plot method plots a time series in REPL, using the UnicodePlots package.

Usage
       
        using MarketData
        plot(cl)
        plot(ohlc, 4) # the fourth column ("Close") will be plotted

Method Signature(s)

      plot(t::TimeSeries.TimeArray, n::Int=1)

Details

      UnicodePlots provides simple plots inside of REPL. The plot() method is a wrapper for the UnicodePlots.lineplot()
      method that takes a TimeSeries.TimeArray as the first argument. The second argument defines the column to be 
      plotted and defaults to n=1.

References

      https://github.com/Evizero/UnicodePlots.jl

See Also
 
      hist() which plots a histogram of a time series.
"""

function plot(t::TimeSeries.TimeArray, n::Int=1)
    v = t.values[:,n]
    s = t.timestamp
    c = t.colnames[n]
    isa(t.meta, AbstractString) ? m = t.meta :  m = ""
    lineplot(s, v, title=m, name=c)
end
