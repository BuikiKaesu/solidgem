def brackets_closed?(str)
	expect_closed = 0
	str.each_char.with_index do |ch, index|
		break if expect_closed < 0 or expect_closed > str.size - index
		expect_closed += 1 if ch == "("
		expect_closed -= 1 if ch == ")"
	end
	expect_closed == 0 ? true : false
end

puts brackets_closed?("(())")
puts brackets_closed?("(()))")

