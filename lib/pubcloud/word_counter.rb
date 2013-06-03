require 'tokenizer'
require 'fast-stemmer'
require 'pubcloud/token'
require 'active_support/inflector'

class WordCounter 
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
  
def token_ok?(t)
  t.length > 0 && (t =~ /\A\w*\z/)
                        
end


  private 
  def count_frequency
    tokens = Hash.new
    tokenizer = Tokenizer::Tokenizer.new
    tokenizer.tokenize(@text).each do |token_str|
      token_str = token_str.strip.downcase.singularize
      next unless token_ok? token_str
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
