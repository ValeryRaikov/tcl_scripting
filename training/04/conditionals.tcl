puts "Conditional statements"

set age 50

if {$age < 18} { puts Immature } else { puts Mature }

puts "Today is [set day Monday]"

if {$day == "Monday"} {
	puts "Toay is a bad day!"
} elseif {$day == "Tuesday" || $day == "Wednseday" || $day == "Thursday"} {
	puts "Today is a fine day!"
} else {
	puts "Today is a perfect day!"
}

puts "Let's test this as well: [expr {$age < 18 ? "Immature" : "Mature"}]"