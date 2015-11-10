"""
Description

      The kplot() method takes a TimeSeries.TimeArray object, computes the percentchange, and plots a kernel density
      plot using the Winston plotting package.

Usage

      using MarketData
      kplot(cl)
      kplot(cl, caption="Apple Closing prices")
      kplot(ohlc, 4) # the fourth column ("Close") will be transformed and plotted

Method Signature(s)

      kplot(t::TimeSeries.TimeArray, n=1, LHS="red", RHS="green", center=0.0; caption="")

Details

      The kplot() method plots a kernel density using the Winston plotting package. The plot is colored around a defined
      center, which defaults to 0.0. Left- (LHS) and right-side (RHS) colors default to red and green respectively. The first argument is
      a TimeSeries.TimeArray, while the second argument defines the column to be plotted and defaults to n=1. When the meta
      field is occupied with a string, it, along with the column name, becomes the plot's caption. Since the caption is a keyword argument,
      it can be selected be any string with the function call.

References

      https://github.com/nolta/Winston.jl

See Also
 
      uhist(x) which plots time series in REPL
"""

function kplot(t::TimeSeries.TimeArray, n::Int=1, LHS::ASCIIString="red", RHS::ASCIIString="green", center::Float64=0.0; caption::ASCIIString="")

    # initialize Winston
    # KernelDensity.Winston_init()

    v = t.values[:,n]
    c = t.colnames[n]
    isa(t.meta, AbstractString) ? m = t.meta :  m = ""

    # title auto-fill
    if caption == ""
        caption = string(m, " ", c) 
    end

    k  = kde(v)

    x1 = k.x[k.x .<= center]
    x2 = k.x[k.x .> center]
    y1 = k.density[1:length(x1)]
    y2 = k.density[length(x1)+1:end]

    f1 = FillBelow(x1, y1, color=LHS)
    f2 = FillBelow(x2, y2, color=RHS)

    #clean up below
    x3 = linspace(x1[1], last(x2))
    y3 = zeros(x3)
    f3 = FillBelow(x3, y3)

    # plotting
    p = Winston.plot(title=caption)
    add(p, f1, f2, f3)
end
