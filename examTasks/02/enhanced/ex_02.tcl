set constRock 1
set constPaper 2
set constScissors 3

set constLoss 0
set constDraw 3
set constWin 6

set myTotal 0

set filePath "puzzle_v002_inputs/(2).txt"
if {[catch {open $filePath "r"} fh]} {
    puts "Error: Cannot open file"
    exit 1
}

while {[gets $fh line] >= 0} {
    set line [string trim $line]
    if {[llength $line] == 0} { continue }

    set currRound [split $line " "]
    set opponentPlay [lindex $currRound 0]
    set outcome [lindex $currRound 1]

    if {$opponentPlay eq "A"} {
        if {$outcome eq "X"} {
            set myTotal [expr {$myTotal + $constScissors + $constLoss}]
        } elseif {$outcome eq "Y"} {
            set myTotal [expr {$myTotal + $constRock + $constDraw}]
        } elseif {$outcome eq "Z"} {
            set myTotal [expr {$myTotal + $constPaper + $constWin}]
        }
    } elseif {$opponentPlay eq "B"} {
        if {$outcome eq "X"} {
            set myTotal [expr {$myTotal + $constRock + $constLoss}]
        } elseif {$outcome eq "Y"} {
            set myTotal [expr {$myTotal + $constPaper + $constDraw}]
        } elseif {$outcome eq "Z"} {
            set myTotal [expr {$myTotal + $constScissors + $constWin}]
        }
    } elseif {$opponentPlay eq "C"} {
        if {$outcome eq "X"} {
            set myTotal [expr {$myTotal + $constPaper + $constLoss}]
        } elseif {$outcome eq "Y"} {
            set myTotal [expr {$myTotal + $constScissors + $constDraw}]
        } elseif {$outcome eq "Z"} {
            set myTotal [expr {$myTotal + $constRock + $constWin}]
        }
    }
}

close $fh

puts "Newly calculated total score: $myTotal"
