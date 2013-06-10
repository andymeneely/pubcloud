require 'helper'
require 'pubcloud/arranger'
require 'pubcloud/layout_grid'
require 'pubcloud/text_size'

class TestArranger < Test::Unit::TestCase

  def test_font_sizes
    layout = LayoutGrid.new(10,10)
    freq = {'apple' => 10000, 'pear' => 100, 'banana' => 10}
    max_font_em = 4
    text_size = TextSize.new('rockwell')
    arr = Arranger.new(layout, freq, text_size, max_font_em)
    assert_equal(4, arr.font_size('apple'))
    assert_equal(2, arr.font_size('pear'))
    assert_equal(1, arr.font_size('banana'))
  end

end
