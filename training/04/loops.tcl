puts "While loops"

set a 0

while {$a < 11} { 
	puts $a
	set a [expr {$a + 1}]
}

set evenNums [list]
set counter 0
while {$counter < 100} {
	if {[expr {$counter % 2 == 0}]} {
        	lappend evenNums $counter
   	} else {
        	puts "Skipping"
        }

    	incr counter 
}

puts "Even numbers length: [llength $evenNums]"

puts "For loops"

for {set i 0} {$i <= 10} {incr i} { puts "Value is $i" }
for {set i 11} {$i > 0} {incr i -1} { puts "Value is $i" }