require 'fast-stemmer'

class Token
  attr_reader :stem, :freq
  
  def initialize(text)
    raise unless text.is_a? String
	#raise if text.contains? ' '
    @stem = text.stem
	@freq = Hash.new
	@freq[text] = 1
  end
  
  def add!(text)
    raise unless @stem==text.stem
	@freq[text] ||= 0
	@freq[text] = @freq[text] + 1
	self
  end
  
  def name
    largest_name = nil
	largest = 0
    @freq.each do |token, count|
		if count > largest
		  largest = count
		  largest_name = token
		elsif count==largest && token.size < largest_name.size
		  largest_name = token
		end
	end
	largest_name
  end
  
  def count
	@freq.inject(0){|total,entry| total+=entry[1] }
  end
  
  def eql?(other)
    @stem.eql? other.stem
  end
  
  def hash
    @stem.hash
  end
end