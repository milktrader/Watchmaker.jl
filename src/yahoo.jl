const SPX = "^GSPC"

function yahoo(stock::ASCIIString) 
    resp = get("http://ichart.yahoo.com/table.csv?s=$stock")
    timearray(resp)
end
