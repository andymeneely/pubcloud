require 'pubcloud/spiral_iterator'

class TestSpiralIterator < Test::Unit::TestCase

  def _test_first_is_center
	itr = SpiralIterator.new({:x=>5,:y=>5}, maxSize=10, numSteps=1)
	times = 0
	itr.each do |x,y|
		assert_equal(5, x)
		assert_equal(5, y)
		times = times + 1
	end
	assert_equal(1, times, "Iterator went more than one time")
  end

  def test_a_few_more
	itr = SpiralIterator.new({:x=>5,:y=>5}, maxSize=10, numSteps=6)
	times = 0
	act_x = []
	act_y = []
	itr.each do |x,y|
	  act_x << x
	  act_y << y
	  times = times + 1
	end
	puts "actual x: #{act_x}\nactual y: #{act_y}"
	assert_equal([5,6,4,2,2,6], act_x)
	assert_equal([5,6,7,5,2,0], act_y)
	assert_equal(6, times)
  end
  
end