"""
Description

      The Watchmaker.plot() method uses the Winston plotting package to plot one or more time series
      on a single plot

Usage

      using MarketData   
      plot(cl, op)

Method Signature(s)

      plot(t::TimeSeries.Timearray...)

Details

      The Watchmaker.plot() method takes a variable number of TimeSeries.TimeArray objects (maximum of six) and plots them 
      on a single plot. The color scheme is based on the default_colors constant that is exported in this package.

References

      https://github.com/nolta/Winston.jl

See Also
 
      uplot()

"""

function  plot(ts::TimeSeries.TimeArray...)
    # stop the madness at 6
    length(ts) > 6 ? error("maximum of 6 time series at a time") : n = length(ts)

    # the legend names are taken from the series meta data
    legend = Array(ASCIIString, n)

    # the last time series is outside the loop so just fill it in here
    isa(ts[n].meta, AbstractString) ? legend[n] = ts[n].meta : legend[n] = string(n) 

    for t in 1:n- 1
        # fill out the legend
        isa(ts[t].meta, AbstractString) ? legend[t] = ts[t].meta : legend[t] = string(t) 

        # plot
        Winston.timeplot(ts[t].timestamp, ts[t].values[:,1], color=default_colors[t])
        Winston.hold(true)
    end

    p = Winston.timeplot(ts[n].timestamp, ts[n].values[:,1], color=default_colors[n])
    Winston.hold(false)

    for s in 1:n -1
        lab = Winston.PlotLabel(0.1, 1-0.05s, legend[s], color=default_colors[s])
        Winston.add(p, lab)
    end
 
    lab = Winston.PlotLabel(0.1, 1-0.05n, legend[n], color=default_colors[n])
    return Winston.add(p, lab)

end
