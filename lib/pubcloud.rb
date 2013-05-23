require 'tokenizer'
require 'fast-stemmer'
require 'pubcloud/token'
require 'active_support/inflector'

class Pubcloud
  attr_reader :tokens

  def initialize(text)
    raise unless text.is_a? String
    @text=text
  end
  
  def frequencies
	@tokens ||= count_frequency
	table = Hash.new
	@tokens.each { |token,flag| table[token.name] = token.count}
	table
  end
  
  private 
  def count_frequency
    tokens = Hash.new
    tokenizer = Tokenizer::Tokenizer.new
	tokenizer.tokenize(@text).each do |token_str|
	  token_str = token_str.downcase.singularize
	  token = Token.new(token_str)
	  if tokens[token].nil?
	    tokens[token] = token # Yes, a hash that maps to itself...
	  else
	    tokens[token].add! token_str
	  end
	end
	tokens
  end
end