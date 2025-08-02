set mostCalories 0
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
        # Blank line signals end of a group
        if {$currCalories > $mostCalories} {
            set mostCalories $currCalories
        }
        set currCalories 0
    } elseif {[string is integer -strict $line]} {
        set currCalories [expr {$currCalories + $line}]
    } else {
        puts "Warning: Non-integer line '$line' ignored"
    }
}

if {$currCalories > $mostCalories} {
    set mostCalories $currCalories
}

close $fh

puts "Most Calories: $mostCalories"
puts "Total Lines Read: $countLines"
