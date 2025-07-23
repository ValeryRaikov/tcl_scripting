set mostCalories 0

set fh [open "puzzle_inputs\(1\).txt" r]

set currCalories 0
set countLines 0
while {[gets $fh line] >= 0} {
	if {$line == ""} {
		if {$currCalories > $mostCalories} {
			set mostCalories $currCalories
		}

		set currCalories 0
	} else {
		set currCalories [expr {$currCalories + $line}]
	}

	incr countLines
}

close $fh

puts "Most Calories: $mostCalories"
puts "Total lines: $countLines"