list    = include(Pkg.dir("Colors/src/names_data.jl"))

palette = ASCIIString[]

for (k,v) in list
    push!(palette, k)
end

const default_colors = ["dodgerblue", "red1", "goldenrod", "wheat3", "olive", "burlywood"]
