const tenyear = "DGS10"

function fred(series::ASCIIString) 
    resp = get("https://api.stlouisfed.org/fred/series?series_id=$series")
    timearray(resp)
end
