def factorial(first, last)
	last > first ? last * factorial(first, last-1) : first
end

puts factorial(4,10)