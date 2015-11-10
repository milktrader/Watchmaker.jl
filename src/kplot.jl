"""
Description

      The kplot() method takes a TimeSeries.TimeArray object, computes the percentchange, and plots a kernel density
      plot using the Winston plotting package.

Usage

      using MarketData
      kplot(cl)
      kplot(ohlc, 4) # the fourth column ("Close") will be transformed and plotted

Method Signature(s)

      kplot(t::TimeSeries.TimeArray, n::Int=1; left="red", right="green", center::Float64=0.0)

Details

      The kplot() method plots a kernel density using the Winston plotting package. The plot is colored around a defined
      center, which defaults to 0.0. Left- and right-side colors default to red and green respectively. The first argument is
      a TimeSeries.TimeArray, while the second argument defines the column to be plotted and defaults to n=1. When the meta 
      field is occupied with a string, it, along with the column name,  becomes the plot's title. 

References

      https://github.com/nolta/Winston.jl

See Also
 
      uhist(x) which plots time series in REPL
"""

function kplot(t::TimeSeries.TimeArray, n::Int=1, left="red", right="green", center::Float64=0.0; kwargs...)
    # initialize Winston
    KernelDensity.Winston_init()

    v = t.values[:,n]
    k = kde(v)
    c = t.colnames[n]
    isa(t.meta, AbstractString) ? m = t.meta :  m = ""

    # plotting
    Winston.plot(k, title=string(m, " ", c); kwargs...)
end
