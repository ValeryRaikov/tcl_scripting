puts "Demo of arithmetic, logical and bitwise operations in tcl"

set a 10
set b 5

set addition [expr {$a + $b}]
set subtraction [expr {$a - $b}]
set mult [expr {$a * $b}]
set div [expr {$a / $b}]

puts "Results:\naddition: $addition\nsubtraction: $subtraction\nmultiplication: $mult\ndivision: $div"

puts [expr {10 + 5}]
puts [expr {10.0 + 5}]
puts [expr {12 / 7}]
puts [expr {12 / 7.0}]
puts [expr {12.0 / 7}]
puts [expr {12 / 7 + 3.0}]

set a 1
set b 0
puts "A&&B = [expr {$a && $b}]"
puts "A||B = [expr {$a || $b}]"
puts "!A = [expr {!$a}]"

set binaryA 001110101100
set binaryB 011001101010

puts "A&B is [expr {$binaryA & $binaryB}]"
puts "A|B is [expr {$binaryA | $binaryB}]"
puts "A^B is [expr {$binaryA ^ $binaryB}]"