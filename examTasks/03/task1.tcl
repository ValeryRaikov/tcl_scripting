proc letterValue {char} {
    set ascii [scan $char %c]

    if {$ascii >= 97 && $ascii <= 122} {
        return [expr {$ascii - 96}]
    } elseif {$ascii >= 65 && $ascii <= 90} {
        return [expr {$ascii - 64 + 26}]
    } else {
        return 0
    }
}


set totalSum 0
set foundChars {}

set fh [open "puzzle_spy_input \(3\).txt" "r"]

while {[gets $fh line] >= 0} {
	set currLine [split $line ""]
	set halfLength [expr {[llength $currLine] / 2}]
	set leftPart [lrange $currLine 0 [expr {$halfLength - 1}]]
	set rightPart [lrange $currLine $halfLength end]

	set found 0
    	for {set i 0} {$i < $halfLength && !$found} {incr i} {
        	for {set j 0} {$j < $halfLength} {incr j} {
            		if {[lindex $leftPart $i] eq [lindex $rightPart $j]} {
                		lappend foundChars [lindex $leftPart $i]
                		set found 1
                		break
            		}
        	}
    	}
}

foreach ch $foundChars {
	set totalSum [expr {$totalSum + [letterValue $ch]}]
}

close $fh

puts "Found chars: $foundChars"
puts "Total sum is: $totalSum"