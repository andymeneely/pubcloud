require 'pubcloud/spiral_iterator'

class TestSpiralIterator < Test::Unit::TestCase

  # def test_first_is_center
	# itr = SpiralIterator.new({:row=>5,:col=>5}, maxSize=10, numSteps=1)
	# times = 0
	# itr.each do |row,col|
		# assert_equal(5, row)
		# assert_equal(5, col)
		# times = times + 1
	# end
	# assert_equal(1, times, "Iterator went more than one time")
  # end

  def test_a_spiral
	itr = SpiralIterator.new(width=3, center={:row=>5,:col=>5})
	act_row = []
	act_col = []
	itr.each do |row,col|
	  act_row << row
	  act_col << col
	end
	#puts "actual x: #{act_row}\nactual y: #{act_col}"
	assert_equal([5,5,4,4,4,5,6,6,6], act_row)
	assert_equal([5,6,6,5,4,4,4,5,6], act_col)
  end
  
end