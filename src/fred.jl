function fred(series::ASCIIString) 
    resp = get("http://research.stlouisfed.org/fred2/series/$series/downloaddata/$series.csv")
    timearray(resp)
end
