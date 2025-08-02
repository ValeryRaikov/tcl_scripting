proc letterValue {char} {
    set ascii [scan $char %c]
    if {$ascii >= 97 && $ascii <= 122} {
        return [expr {$ascii - 96}]         ;# a–z: 1–26
    } elseif {$ascii >= 65 && $ascii <= 90} {
        return [expr {$ascii - 64 + 26}]    ;# A–Z: 27–52
    } else {
        return 0
    }
}

set totalSum 0
set foundChars {}
set allLines {}

set filePath "puzzle_spy_input (3).txt"
if {[catch {open $filePath r} fh]} {
    puts "Error opening file!"
    exit 1
}

while {[gets $fh line] >= 0} {
    lappend allLines [string trim $line]
}

close $fh

for {set i 0} {$i <= [expr {[llength $allLines] - 3}]} {incr i 3} {
    set line1 [split [lindex $allLines $i] ""]
    set line2 [split [lindex $allLines [expr {$i + 1}]] ""]
    set line3 [split [lindex $allLines [expr {$i + 2}]] ""]

    array unset in2
    array unset in3
    foreach c $line2 { set in2($c) 1 }
    foreach c $line3 { set in3($c) 1 }

    foreach c $line1 {
        if {[info exists in2($c)] && [info exists in3($c)]} {
            lappend foundChars $c
            set totalSum [expr {$totalSum + [letterValue $c]}]
            break
        }
    }
}

puts "Found characters: $foundChars"
puts "Total sum is: $totalSum"
