# lets solve this task using if conditional statements instead of switch statement
set constRock 1
set constPaper 2
set constScissors 3

set constLoss 0
set constDraw 3
set constWin 6

set myTotal 0

set fh [open "puzzle_v002_inputs\(2\).txt" "r"]

while {[gets $fh line] >= 0} {
        set currRound [split $line " "]
        set opponentPlay [lindex $currRound 0]
        set outcome [lindex $currRound 1]

        if {$opponentPlay == "A"} {
                if {$outcome == "X"} {
                        set myTotal [expr {$myTotal + $constScissors + $constLoss}]
                } elseif {$outcome == "Y"} {
                        set myTotal [expr {$myTotal + $constRock + $constDraw}]
                } else {
                        set myTotal [expr {$myTotal + $constPaper + $constWin}]
                }
        } elseif {$opponentPlay == "B"} {
                if {$outcome == "X"} {
                        set myTotal [expr {$myTotal + $constRock + $constLoss}]
                } elseif {$outcome == "Y"} {
                        set myTotal [expr {$myTotal + $constPaper + $constDraw}]
                } else {
                        set myTotal [expr {$myTotal + $constScissors + $constWin}]
                }
        } else {
                if {$outcome == "X"} {
                        set myTotal [expr {$myTotal + $constPaper + $constLoss}]
                } elseif {$outcome == "Y"} {
                        set myTotal [expr {$myTotal + $constScissors + $constDraw}]
                } else {
                        set myTotal [expr {$myTotal + $constRock + $constWin}]
                }
        }

}

close $fh

puts "Newly calculated total score: $myTotal"