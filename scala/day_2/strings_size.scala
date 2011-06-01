val strings = List("Herp", "Derp", "Herp")

val total_size = (0 /: strings) ((sum, string) => sum + string.size)

println(total_size)
