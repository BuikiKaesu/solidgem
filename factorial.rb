class Fixnum 
	def fact
		self > 1 ? self * (self - 1).fact : 1
	end
end

class Range
	def fact
		self.last > self.first ? self.last * (self.last-1).fact : 1
	end
end

puts 7.fact

puts (1..9).fact