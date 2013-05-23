require 'tokenizer'
require 'fast-stemmer'

class Pubcloud
  def initialize(text)
    raise unless text.is_a? String
    @text=text
  end
  
  def frequencies
	@freq ||= count_frequency
  end
  
  private 
  def count_frequency
    @freq = Hash.new
    tokenizer = Tokenizer::Tokenizer.new
	tokenizer.tokenize(@text).each{|token|
	  token.downcase!
	  stem = token.stem
	  @freq[stem] ||= Array.new
	  @freq[stem] << token
	}
	@freq
  end

 end