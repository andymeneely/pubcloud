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
	tokenizer.tokenize(@text).each{|token_str|
	  token_str.downcase!
	  stem = token_str.stem
	  @freq[stem] ||= Array.new
	  @freq[stem] << token_str
	}
	@freq
  end
end