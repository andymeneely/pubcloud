require 'helper'
require 'pubcloud/layout_grid'

class TestLayoutGrid < Test::Unit::TestCase
  def test_zero
    grid = LayoutGrid.new(width=0, height=0)
    assert_equal("<table></table>", grid.to_html)
  end

  def test_two_by_two
    grid = LayoutGrid.new(width=2, height=2)
    assert_equal("<table><tr><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr></table>", grid.to_html)
  end
end