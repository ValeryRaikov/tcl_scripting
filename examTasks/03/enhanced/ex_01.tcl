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

set filePath "puzzle_spy_input (3).txt"

if {[catch {open $filePath r} fh]} {
    puts "Error opening file!"
    exit 1
}

while {[gets $fh line] >= 0} {
    set line [string trim $line]
    set halfLen [expr {[string length $line] / 2}]
    
    set leftPart [string range $line 0 [expr {$halfLen - 1}]]
    set rightPart [string range $line $halfLen end]

    array unset seen
    foreach ch [split $rightPart ""] {
        set seen($ch) 1
    }

    foreach ch [split $leftPart ""] {
        if {[info exists seen($ch)]} {
            lappend foundChars $ch
            set totalSum [expr {$totalSum + [letterValue $ch]}]
            break
        }
    }
}

close $fh

puts "Found characters: $foundChars"
puts "Total priority sum: $totalSum"
