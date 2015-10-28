"""
Description

        The yahoo method is a wrapper for downloading historical stock prices from Yahoo.

Usage

        AAPL = yahoo("AAPL)
        SPX = yahoo()

Method Signature(s)

      yahoo1(stock::ASCIIString="^GSPC")

Details

      The yahoo method takes a stock name in the form of a string and returns a TimeArray corresponding to the 
      Yahoo Finance ticker. With no argument, the default historical time series is the S&P 500.

References

      http://www.finance.yahoo.com

See Also
 
      fred() which accesses the St. Louis Federal Reserve financial and economic data sets.

"""

function yahoo(stock::ASCIIString="^GSPC") 
    resp = get("http://ichart.yahoo.com/table.csv?s=$stock")
    timearray(resp)
end
