array set shapeScore {rock 1 paper 2 scissors 3}
array set outcomeScore {loss 0 draw 3 win 6}

array set myMoveMap {X rock Y paper Z scissors}
array set oppMoveMap {A rock B paper C scissors}

array set resultMatrix {
    rock:rock draw
    rock:paper win
    rock:scissors loss
    paper:rock loss
    paper:paper draw
    paper:scissors win
    scissors:rock win
    scissors:paper loss
    scissors:scissors draw
}

set myTotal 0
set filePath "puzzle_v002_inputs/(2).txt"

if {[catch {open $filePath r} fh]} {
    puts "Error opening file"
    exit 1
}

while {[gets $fh line] >= 0} {
    set line [string trim $line]
    if {[llength [split $line]] != 2} {
        puts "Invalid line: $line"
        continue
    }

    lassign [split $line] oppCode myCode

    set oppPlay $oppMoveMap($oppCode)
    set myPlay $myMoveMap($myCode)

    set outcomeKey "${oppPlay}:${myPlay}"
    if {![info exists resultMatrix($outcomeKey)]} {
        puts "Unexpected matchup: $outcomeKey"
        continue
    }

    set outcome $resultMatrix($outcomeKey)

    set roundScore [expr {$shapeScore($myPlay) + $outcomeScore($outcome)}]
    set myTotal [expr {$myTotal + $roundScore}]
}

close $fh

puts "Total score: $myTotal"
