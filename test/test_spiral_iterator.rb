require 'pubcloud/spiral_iterator'

class TestSpiralIterator < Test::Unit::TestCase
  def run_iterator(width, center)
    itr = SpiralIterator.new(width=width, center=center)
	act = Hash.new
    act[:row] = []
	act[:col] = []
	itr.each do |row,col|
	  act[:row] << row
	  act[:col] << col
	end
    return act
  end 
   
  def test_a_spiral
	act = run_iterator(width=3, {:row=>5,:col=>5})
	assert_equal([5,5,4,4,4,5,6,6,6], act[:row])
	assert_equal([5,6,6,5,4,4,4,5,6], act[:col])
  end

  def test_bigger_spiral
    act = run_iterator(width=5, {:row=>5,:col=>5})
	assert_equal([5,5,4,4,4,5,6,6,6,6,5,4,3,3,3,3,3,4,5,6,7,7,7,7,7], act[:row])
	assert_equal([5,6,6,5,4,4,4,5,6,7,7,7,7,6,5,4,3,3,3,3,3,4,5,6,7], act[:col])
  end   
end