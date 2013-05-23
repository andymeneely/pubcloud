require 'helper'
require 'pubcloud'

class TestPubcloud < Test::Unit::TestCase
  @test_order = :defined

  def test_00_simple
	exp ={
	  "dark" => ["dark"],
	  "and" => ["and"],
	  "stormi" => ["stormy"]
	}
    assert_equal(exp, Pubcloud.new('dark and stormy').frequencies)
  end
  
  def test_counts
	exp ={
	  "depart" => ["department","department"],
	  "redund" => ["redundancy"],
	  "of" => ["of"]
	}
    assert_equal(exp, Pubcloud.new('Department of Redundancy Department').frequencies)
  end
  
end