require 'helper'
require 'pubcloud/token'

class TestToken < Test::Unit::TestCase

  def test_init
    token = Token.new('computing')
    assert_equal('comput', token.stem)
	assert_equal({'computing'=>1}, token.freq)
  end
  
  def test_name
    assert_equal('computing', Token.new('computing').name)
  end
  
  def test_add_happypath
    token = Token.new('computing')
    token.add! 'computer'
	token.add! 'computers'
	token.add! 'computer'
	assert_equal('computer', token.name)
  end
  
  def test_add_tiebreaker
    token = Token.new('computing')
    token.add! 'computing'
	token.add! 'computers'
	token.add! 'computer'
	token.add! 'computer'
	assert_equal('computer', token.name)
  end
  
  def test_add_non_stem
    token = Token.new('computing')
    assert_raise RuntimeError do
	  token.add! 'alfalfa'
	end
  end
  
  def test_eql?
    token1 = Token.new('computing')
	token2 = Token.new('computer')
    assert(token1.eql? token2)
  end
  
  def test_hash
    token = Token.new('computing')
    assert_equal('comput'.hash, token.hash)
  end
  
end
