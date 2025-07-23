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
set allLines {}
set foundChars {}

set fh [open "puzzle_spy_input \(3\).txt" "r"]
while {[gets $fh line] >= 0} {
    lappend allLines $line
}

close $fh

for {set i 0} {$i <= [expr {[llength $allLines] - 3}]} {incr i 3} {
    set currLine [split [lindex $allLines $i] ""]
    set nextLine [split [lindex $allLines [expr {$i + 1}]] ""]
    set finalLine [split [lindex $allLines [expr {$i + 2}]] ""]

    set found 0
    foreach ch $currLine {
        if {[lsearch $nextLine $ch] != -1 && [lsearch $finalLine $ch] != -1} {
            lappend foundChars $ch
            set found 1
            break
        }
    }
}

foreach ch $foundChars {
    set totalSum [expr {$totalSum + [letterValue $ch]}]
}

puts "Found chars: $foundChars"
puts "Total sum is: $totalSum"