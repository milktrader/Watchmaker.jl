"""
Description

      The last() method returns the last n number of observations in a TimeArray

Usage

      using MarketData
      last(cl)     # returns the last observation
      last(cl, 10) # returns the last 10 observations

Method Signature(s)

      last(ts::TimeSeries.TimeArray, n::Int=1)

Details

      The last function subsets a TimeSeries.Timearray by the last n observations. When n is not supplied, it
      defaults to n=1.

See Also
 
      last() which takes the last n observations from a TimeSeries.TimeArray

"""

function last(ts::TimeSeries.TimeArray, n::Int=1)
   ts[length(ts)-n+1:length(ts)] 
end
