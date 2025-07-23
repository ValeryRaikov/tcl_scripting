# The winner of the whole tournament is the player with the highest score. Your total score is the sum of your score for each round. The score is calculated as follows: (1 for Rock, 2 for Paper and 3 for Scissors) + (0 if you lost, 3 if it is a draw and 6 if you won).

set constRock 1
set constPaper 2
set constScissors 3

set constLoss 0 
set constDraw 3
set constWin 6

set myTotal 0

set fh [open "puzzle_v002_inputs\(2\).txt" r]

while {[gets $fh line] >= 0} {
	set currRound [split $line " "]
	set opponentPlay [lindex $currRound 0]
	set myPlay [lindex $currRound 1]

	switch $opponentPlay {
		A {
			switch $myPlay {
				X {
					set myTotal [expr {$myTotal + $constRock + $constDraw}]
				}
				Y {
					set myTotal [expr {$myTotal + $constPaper + $constWin}]
				}
				Z {
					set myTotal [expr {$myTotal + $constScissors + $constLoss}]
				}
				default { puts Error }
			}
                } B {
                        switch $myPlay {
                                X {
                                        set myTotal [expr {$myTotal + $constRock + $constLoss}]
                                }
                                Y {
                                        set myTotal [expr {$myTotal + $constPaper + $constDraw}]
                                }
                                Z {
                                        set myTotal [expr {$myTotal + $constScissors + $constWin}]
                                }
				default { puts Error }
			}
                } C {
                        switch $myPlay {
                                X {
                                        set myTotal [expr {$myTotal + $constRock + $constWin}]
                                }
                                Y {
                                        set myTotal [expr {$myTotal + $constPaper + $constLoss}]
                                }
                                Z {
                                        set myTotal [expr {$myTotal + $constScissors + $constDraw}]
                                }
                                default { puts Error }
			}
                } default { puts Error }
	}
}

close $fh

puts "Total score: $myTotal"