"""
Description

        The fred method is a wrapper to download financial and economic time series data from the 
        St. Louis Federal Reserve (FRED).

Usage

        DGS = fred("DGS10")
        CPI = fred()

Method Signature(s)

      fred1(series::ASCIIString="CPIAUCNS")

Details

      The fred method takes a string argument that corresponds to a series code from the St. Louis Federal
      Reserve (FRED) database. It returns the data in the TimeSeries.TimeArray data structure.  When no argument 
      is provided, the default data set is the Consumer Price Index for All Urban Consumers: All Items (CPIAUCNS). 

References

      https://research.stlouisfed.org/fred2

See Also

      yahoo() which is a wrapper from downloading financial time series for stocks from Yahoo Finance.

"""

function fred(series::ASCIIString="CPIAUCNS")
    resp = get("http://research.stlouisfed.org/fred2/series/$series/downloaddata/$series.csv")
    timearray(resp, m=series)
end
