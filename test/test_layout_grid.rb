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
    grid = LayoutGrid.new(width=5, height=2)
    plum = GridBlock.new(Token.new("plum"), font_size=1.0)
    assert_equal(4, plum.colspan)
    assert_equal(1, plum.rowspan)
    ret = grid.add!(plum,0,0)

    exp = "<table>#{tr("<td colspan=4 rowspan=1>plum</td><td>&nbsp;</td>")}#{tr(td("&nbsp;")*5)}</table>"
    assert_equal(exp, grid.to_html)
    assert_equal(:ok, ret)
  end
  
  def test_add_fills_up
    grid = LayoutGrid.new(width=2, height=1)
    a = GridBlock.new(Token.new("ab"),font_size=1.0)
    ret = grid.add!(a, 0,0)
    assert_equal(:ok, ret)
    assert_equal("<table>#{tr("<td colspan=2 rowspan=1>ab</td>")}</table>", grid.to_html)
  end
  
  def test_add_fills_up_rows_too
    grid = LayoutGrid.new(width=4, height=2)
    a = GridBlock.new(Token.new("ab"),font_size=2.0)
    ret = grid.add!(a, 0,0)
    assert_equal(:ok, ret)
    assert_equal("<table>#{tr("<td colspan=4 rowspan=2>ab</td>")}#{tr("")}</table>", grid.to_html)
  end
  
  def test_add_collide!
    grid = LayoutGrid.new(width=5, height=2)
    plum = GridBlock.new(Token.new("plum"), font_size=1.0)
    a = GridBlock.new(Token.new("a"),font_size=1.0)
    ret = grid.add!(plum,0,0)
    assert_equal(:ok, ret, "Unexpected collision")
    
    ret = grid.add!(a,0,3)
    assert_equal(:collision, ret, "Should have been a collision!")
  end
  
  def test_add_out_of_bounds_negative
    grid = LayoutGrid.new(width=2, height=2)
    a = GridBlock.new(Token.new("a"),font_size=1.0)
    ret = grid.add!(a, -1,0)
    assert_equal(:out_of_bounds, ret, "Something was accidentally placed...")
    assert_equal("<table>#{tr(td("&nbsp;")*2)*2}</table>", grid.to_html)
    
    ret = grid.add!(a, 0,-1)
    assert_equal(:out_of_bounds, ret, "Something was accidentally placed...")
    assert_equal("<table>#{tr(td("&nbsp;")*2)*2}</table>", grid.to_html)
  end
  
  def test_add_out_of_bounds_too_big
    grid = LayoutGrid.new(width=2, height=2)
    a = GridBlock.new(Token.new("abc"),font_size=1.0)
    ret = grid.add!(a, 0,0)
    assert_equal(:out_of_bounds, ret, "Something was accidentally placed...")
    assert_equal("<table>#{tr(td("&nbsp;")*2)*2}</table>", grid.to_html)
  end
  
  def tr(str)
    "<tr>#{str}</tr>"
  end
  
  def td(str)
    "<td>#{str}</td>"
  end
  
end