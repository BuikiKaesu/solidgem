require 'benchmark'

class Array
  def find_missed
    result = []
    missed = (last - first + 1) - size # find missing elements count
    if missed > 0  
      if self.size == 2
	diff = self[-1] - self[0] 
	diff >= 3 ? result += (first+1..last-1).to_a : result << self[0] + 1       
      else
        mid = size / 2  # find mid element
        shift = self[mid] - mid - self[0] # find shift
        if shift == 0
          result += self[mid..-1].find_missed
        elsif shift > 0 && shift < missed
          result += self[mid..-1].find_missed 
          result += self[0..mid].find_missed 
        else
          result += self[0..mid].find_missed
        end
      end
    end
    result
  end
end

array = (1..1000000).to_a
deleted = []
array.sample(5).each { |s| deleted << array.delete(s) }
puts "deleted: #{deleted.sort}"
puts "found: #{array.find_missed.sort}"





