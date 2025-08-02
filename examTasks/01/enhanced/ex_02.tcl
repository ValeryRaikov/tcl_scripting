set calories {}
set currCalories 0
set countLines 0

set filePath "puzzle_inputs/(1).txt"

if {[catch {open $filePath r} fh]} {
    puts "Error: Cannot open file '$filePath'"
    exit 1
}

while {[gets $fh line] >= 0} {
    set line [string trim $line]
    incr countLines

    if {$line eq ""} {
        lappend calories $currCalories
        set currCalories 0
    } elseif {[string is integer -strict $line]} {
        set currCalories [expr {$currCalories + $line}]
    } else {
        puts "Warning: Non-integer input ignored: '$line'"
    }
}

if {$currCalories > 0} {
    lappend calories $currCalories
}

close $fh

set sortedCalories [lsort -integer -decreasing $calories]
set top3 [lrange $sortedCalories 0 2]
set sumOfThreeMostCals 0

foreach cal $top3 {
    puts "Calories group: $cal"
    set sumOfThreeMostCals [expr {$sumOfThreeMostCals + $cal}]
}

puts "Total lines read: $countLines"
puts "Sum of top 3 calorie groups: $sumOfThreeMostCals"
