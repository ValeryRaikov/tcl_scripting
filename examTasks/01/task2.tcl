set calories {}

set fh [open "puzzle_inputs\(1\).txt" r]

set currCalories 0
set countLines 0
while {[gets $fh line] >= 0} {
	if {$line == ""} {
		lappend calories $currCalories
		set currCalories 0
	} else {
		set currCalories [expr {$currCalories + $line}]
	}
	
	incr countLines
}

close $fh

set flag 0
set sumOfThreeMostCals 0
foreach cal [lsort -integer -decreasing $calories] {
        set sumOfThreeMostCals [expr {$sumOfThreeMostCals + $cal}]

	puts $cal
	if {$flag >= 2} {
		break
	}
	
	incr flag
}

puts "Total lines: $countLines"
puts "Total Calories of the three people with most of them is: $sumOfThreeMostCals"