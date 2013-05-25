require 'helper'
require 'pubcloud/layout_grid'

class TestLayoutGrid < Test::Unit::TestCase
  def test_zero
    grid = LayoutGrid.new(width=0, height=0)
    assert_equal("<table></table>", grid.to_html)
  end

  def test_two_by_two
    grid = LayoutGrid.new(width=2, height=2)
    exp = "<table>#{tr(td("&nbsp;")*2)*2}</table>"
    assert_equal(exp, grid.to_html)
  end
  
  def test_add_multi_row_multi_col
    grid = LayoutGrid.new(width=3, height=3)
    exp = "<table>#{tr(td("&nbsp;")*3)*3}</table>"
    assert_equal(exp, grid.to_html)
  end
  
  def tr(str)
    "<tr>#{str}</tr>"
  end
  
  def td(str)
    "<td>#{str}</td>"
  end
  
end