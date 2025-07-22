puts "this is a simple test file in VIM to simulate the use of tcl"

set a 10
set b 150
set result [expr {$a + $b}]
set result2 [expr {$a - $b}]

puts "Result of addition is $result"
puts "Result of subtraction is $result2"