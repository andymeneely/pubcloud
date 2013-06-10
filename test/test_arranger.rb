require 'helper'
require 'pubcloud/arranger'
require 'pubcloud/layout_grid'
require 'pubcloud/text_size'

class TestArranger < Test::Unit::TestCase

  def setup
    @freq = {'apple' => 10000, 'pear' => 100, 'banana' => 10}
    @max_font_em = 4
    @text_size = TextSize.new('rockwell')
  end

  def test_font_sizes
    arr = Arranger.new(@freq, @text_size, @max_font_em)
    assert_equal(4, arr.font_size('apple'))
    assert_equal(2, arr.font_size('pear'))
    assert_equal(1, arr.font_size('banana'))
  end

  def test_lay_it_out
    arr = Arranger.new(@freq, @text_size, @max_font_em)
    grid = LayoutGrid.new(10,10)
    arr.lay_it_out(grid)
    puts grid.to_html
    assert_equal(1,2,"this test isn't done!")
  end

end
