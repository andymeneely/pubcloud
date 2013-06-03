require 'helper'
require 'pubcloud/word_counter'

class TestWordCounter < Test::Unit::TestCase
  
  def test_00_simple
	exp ={
	  "dark" => 1,
	  "and" => 1,
	  "stormy" => 1
	}
    assert_equal(exp, WordCounter.new('dark and stormy').frequencies)
  end
  
  def test_counts
	exp ={
	  "department" => 2,
	  "redundancy" => 1,
	  "of" => 1
	}
    assert_equal(exp, WordCounter.new('Department of Redundancy Department').frequencies)
  end
  
  def test_smaller_tiebreaker
	exp ={
	  "mouse" => 2,
	  "compute" => 2,
	  "moose" => 1
	}
    assert_equal(exp, WordCounter.new('compute computer Mice mice moose').frequencies)
  end 
  
  def test_smaller_tiebreaker_singularize
	exp ={
	  "mouse" => 2,
	  "moose" => 1
	}
    assert_equal(exp, WordCounter.new('Mouse mice moose').frequencies)
  end 
end
