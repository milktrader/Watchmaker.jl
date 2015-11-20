"""
Description

      The first() method returns the first n number of observations in a TimeArray

Usage

      using MarketData
      first(cl)     # returns the first observation
      first(cl, 10) # returns the first 10 observations

Method Signature(s)

      first(ts::TimeSeries.TimeArray, n::Int=1)

Details

      The first function subsets a TimeSeries.Timearray by the first n observations. When n is not supplied, it
      defaults to n=1.

See Also
 
      last() which takes the last n observations from a TimeSeries.TimeArray

"""

function first(ts::TimeSeries.TimeArray, n::Int=1)
   ts[1:n] 
end
