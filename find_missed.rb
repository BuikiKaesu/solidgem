class Array
  def find_missed
    result = []
    missed = (last - first + 1) - size
    if self.size == 2
      result << self[0] + 1 
      result << self[0] + 2 if self[-1] - self[0] == 3 # if missed elements follow each other
    else
      mid = size % 2 == 0 ? size / 2 : (size+1) / 2 # find mid element
      shift = self[mid - 1] - (mid) - (self[0] - 1) # find shift
      case shift
        when 0 # when missing elements on the right
          result += self[mid-1..-1].find_missed
        when 1 # when missing elements on both sides
          result += self[mid-1..-1].find_missed if missed > 1
          result += self[0..mid-1].find_missed 
        when 2 # when missing elements on the left
          result += self[0..mid-1].find_missed
      end
    end
    result
  end
end

array = (1..1000000).to_a
puts "delete:"
array.sample(2).each { |s| puts array.delete(s) }
puts "found:"
puts array.find_missed

