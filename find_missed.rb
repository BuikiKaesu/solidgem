class Array

  def find_missed(result = [])
    missed = (last - first + 1) - size 
    if missed > 0  
      if self.size == 2
        diff = last - first 
        diff >= 3 ? result += (first+1..last-1).to_a : result << first + 1       
      else
        mid = size / 2 
        shift = self[mid] - mid - first
        if shift == 0
          self[mid..-1].find_missed(result)
        elsif shift > 0 && shift < missed
          self[mid..-1].find_missed(result)
          self[0..mid].find_missed(result)
        else
          self[0..mid].find_missed(result)
        end
      end
    end
  end

end

array = (1..1000000).to_a
deleted = []
array.sample(5).each { |s| deleted << array.delete(s) }
puts "deleted: #{deleted.sort}"
puts "found: #{array.find_missed.sort}"





