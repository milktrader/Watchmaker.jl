"""
Description

        The plot method plots a time series in REPL, using the UnicodePlots package.

Usage
       
        using MarketData
        plot(cl)

Method Signature(s)

      plot(t::TimeSeries.TimeArray)

Details

      UnicodePlots provides simple plots inside of REPL. The plot() method is a wrapper for UnicodePlots.lineplot()
      method that takes a TimeSeries.TimeArray as the only argument. The plots are simple and useful for a quick look at
      the pattern of a time series.
      

References

      https://github.com/Evizero/UnicodePlots.jl
"""

function plot(t::TimeSeries.TimeArray)
    v = t.values[:,1]
    s = t.timestamp
    n = t.colnames[1]
    isa(t.meta, AbstractString) ? m = t.meta :  m = ""
    lineplot(s, v, title=m, name=n)
end
