require 'helper'
require 'pubcloud/grid_block'

class TestGridBlock < Test::Unit::TestCase

  def test_rowspan_colspan
    grid_block = GridBlock.new(token = Token.new("hobbit"), font_size=1.0)
    assert_equal(1.0, grid_block.rowspan)
    assert_equal(6.0, grid_block.colspan)
  
  end

end