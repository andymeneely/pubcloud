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

  def test_non_alpha
    exp = {
      "a" => 3
    }
    assert_equal(exp, WordCounter.new('a - a \' " a. b\'b').frequencies)
  end

  def test_word_limit
    exp = {
      "a" => 3,
      "b" => 2
    }
    assert_equal(exp, WordCounter.new('c d e b b a a a').frequencies(2))
  end

   def test_word_limit_sorting
    exp = {
      "aaa" => 2,
      "bb" => 2,
      "c" => 1
    }
    assert_equal(exp, WordCounter.new('c bb aaa bb aaa').frequencies)
  end
   
   def test_word_limit_sorting_other_way
    exp = {
      "aaa" => 2,
      "bb" => 2,
      "c" => 1
    }
    assert_equal(exp, WordCounter.new('c aaa aaa bb bb').frequencies)
  end

end
