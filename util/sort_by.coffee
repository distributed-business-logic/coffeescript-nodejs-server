module.exports = (field, reverse, primer) ->
    # Function for sorting a list of objects. Adapted from: http://stackoverflow.com/a/979325
    #
    # @example
    # homes = [ { city: "Dallas", price: "162500" }, { city: "Bevery Hills", price: "319250" } ];
    #
    # Sort by price high to low
    # homes.sort sort_by("price", true, parseInt)
    #
    # Sort by city, case-insensitive, A-Z
    # homes.sort sort_by("city", false, (a) -> a.toUpperCase())
    #
    key = if primer then (x) -> primer x[field] else (x) -> x[field]

    (a, b) ->
        a = key(a)
        b = key(b)
        [-1, 1][+!!reverse] * ((a > b) - (b > a))
