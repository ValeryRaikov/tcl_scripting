set arr(0) a
set arr(1) b
set arr(2) c
set arr(3) d
set arr(4) e

set element_to_find d

foreach num [array names arr] {
	if ($arr($num) == $element_to_find} {
		puts "found: $arr($num)"
	}
}