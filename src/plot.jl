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
    length(ts) > 6 ? error("maximum of 6 time series at a time") : n = length(ts)
    
    # the loop takes care of inspecting every max value except the last one
    max_y  = maximum(ts[n].values)
    min_x  = ts[n].timestamp[1]

    # the legend names are taken from the series meta data
    legend = Array(ASCIIString, n)
    # the last time series is outside the loop so just fill it in here
    isa(ts[t].meta, AbstractString) ? legend[n] = ts[n].meta : legend[n] = string(n) 

    for t in 1:n- 1

        # fill out the legend
        isa(ts[t].meta, AbstractString) ? legend[t] = ts[t].meta : legend[t] = string(t) 

        # find the max_y to place the legend
        if maximum(ts[t].values) > max_y 
            max_y = maximum(ts[t].values)
        end

        # find the min_x to place the legend
        if ts[t].timestamp[1] < min_x
            min_x = ts[t].timestamp[1]
        end

        # plot
        Winston.timeplot(ts[t].timestamp, ts[t].values[:,1], color=default_colors[t])
        Winston.hold(true)
    end

    p = Winston.timeplot(ts[n].timestamp, ts[n].values[:,1], color=default_colors[n])
    Winston.hold(false)

    for s in 1:n -1
        lab = Winston.PlotLabel(ts[s].timestamp, max_y, legend[s])
        Winston.add(p, lab, color=default_colors[s])
    end

    lab = Winston.PlotLabel(max_x, max_y, legend[n])
    Winston.add(p, lab, color=default_colors[n])

end
