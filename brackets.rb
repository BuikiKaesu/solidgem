def brackets_closed?(str)
	return true if str.empty?
	string = str.gsub(/\(\)/, "")
	return false if string == str
	brackets_closed?(string)
end

puts "(()())"
puts brackets_closed?("(()())")
puts "()()))"
puts brackets_closed?("()()))")