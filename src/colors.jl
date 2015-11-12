"""
Description

      The colors() method either lists available colors or plots a specified color.

Usage

      colors() # shows color definitions that are available
      colors("goldenrod") # plots the color
      colors("goldenrod", "khaki") # plots both colors

Method Signature(s)

      colors()
      colors(c::ASCIIString)
      colors(c1::ASCIIString, c2::ASCIIString)

Details

      The colors function has two multiple-dispatch definitions. Without an arugment, the method returns
      a list of available colors. When a string is passed, that defined color is plotted. When two strings
      are passed, both colors are platted adjacent to one another. The definitions are derived from the 
      Colors.jl package's src/names_data.jl file. This list includes both X11 and SVG definitions
      and when a collision occurs, the SVG definition takes precedence.

References

      http://www.html.am/html-codes/color/color-code-chart.cfm
      https://github.com/JuliaGraphics/Colors.jl
"""
list    = include(Pkg.dir("Colors/src/names_data.jl"))

palette = ASCIIString[]

for (k,v) in list
    push!(palette, k)
end

function colors()
    println()
    print_with_color(:yellow, "The following colors are available")
    println()
    for p in palette
        print_with_color(:blue, "$p  ")
    end
    println()
end

function colors(c::ASCIIString)
    x   = linspace(0,1)
    y   = zeros(x)
    abv = FillAbove(x, y, color=c)
    blw = FillBelow(x, y, color=c)
    p   = Winston.plot()
    add(p, abv, blw)
end

function colors(c1::ASCIIString, c2::ASCIIString)
    x   = linspace(0,1)
    y   = zeros(x)
    abv = FillAbove(x, y, color=c1)
    blw = FillBelow(x, y, color=c2)
    p   = Winston.plot()
    add(p, abv, blw)
end
