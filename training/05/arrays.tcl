set emps(1) "Valery Raikov"
set emps(2) "Ivan Goshev"
set emps(3) "Maria Petrova"
set emps(4) "Todor Mitev"

puts [array get emps]

# Another way of printing values
foreach {id name} [array get emps] {
	puts "Employee: $id - $name"
}

foreach {record} [lsort [array names emps]] {
	puts "$record - $emps($record)"
}

puts "Total number of employees: [array size emps]"

set emps(2) "Martin Petkov"
foreach {id name} [array get emps] {
        puts "Employee: $id - $name"
}

array set anotherArr {
	1 "Stamat Peshev"
	2 "Peter Velkov"
}

puts [array get anotherEmps]