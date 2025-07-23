set month April

switch -exact $month {
	January -
	February - 
	March { puts "Winter season: $month" }
	April - 
	May - 
	June { puts "Spring season: $month" }
	July - 
	August - 
	September { puts "Summer season: $month" }
	October - 
	November - 
	December { puts "Fall season: $month" }
	default { puts "Error occurred!" }
}