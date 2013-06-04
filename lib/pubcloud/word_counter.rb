require 'tokenizer'
require 'fast-stemmer'
require 'pubcloud/token'
require 'pubcloud/ignored_list'
require 'active_support/inflector'

class WordCounter 
  attr_reader :tokens

  def initialize(text)
    raise unless text.is_a? String
    @text=text
    @list = IgnoredList.new
    inflector_irregulars
  end  

  def frequencies(count_min=1, use_ignores=false)
    @tokens ||= count_frequency(use_ignores)
    table = Hash.new
    @tokens.each { |token,flag| table[token.name] = token.count}

    table.sort do |a,b|
      if((a[1] <=> b[1]) == 0)
        b[0] <=> a[0] # Sort by token length, if tied
      else 
        a[1] <=> b[1] # Sort by token count
      end 
    end

    table.keep_if{|token, count| count >= count_min}
  end

  def token_ok?(t)
    t.length > 0 && (t =~ /\A\w*\z/)
  end

  private 
  def count_frequency(use_ignores)
    tokens = Hash.new
    tokenizer = Tokenizer::Tokenizer.new
    tokenizer.tokenize(@text).each do |token_str|
      token_str = token_str.strip.downcase.singularize
      next unless token_ok? token_str
      next if use_ignores && (@list.ignore? token_str)
      token = Token.new(token_str)
      if tokens[token].nil?
        tokens[token] = token # Yes, a hash that maps to itself...
      else
        tokens[token].add! token_str
      end
    end
    tokens
  end

  def inflector_irregulars
    ActiveSupport::Inflector.inflections do |inflect|
      inflect.uncountable 'this'
    end
  end

end
