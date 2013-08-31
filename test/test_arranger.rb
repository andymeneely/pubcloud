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

  def test_lay_it_out_smoke
    arr = Arranger.new({'apple'=> 10000}, @text_size, @max_font_em)
    grid = LayoutGrid.new(10,10)
    grid = arr.lay_it_out(grid)
    # apple should just be right in the middle at 5,5
    assert_equal('apple', grid.grid[5][5].token.to_s)
  end

  def test_lay_it_out
    arr = Arranger.new(@freq, @text_size, @max_font_em)
    grid = LayoutGrid.new(10,10)
    grid = arr.lay_it_out(grid)
    # Expected looks like this:
    #    
    #    0 1 2 3 4 5 6 7 8 9
    #   ---------------------
    # 0 | | | | | | | | | | |
    #   ---------------------
    # 1 | | | | | | | | | | |
    #   ---------------------
    # 2 | | | | | | | | | | |
    #   ---------------------
    # 3 | | | | | | | | | | |
    #   ---------------------
    # 4 | | | | | | |pear | |
    #   ---------------------
    # 5 | | | | | |apple| | |
    #   ---------------------
    # 6 | | | | |banana | | |
    #   ---------------------
    # 7 | | | | | | | | | | |
    #   ---------------------
    # 8 | | | | | | | | | | |
    #   ---------------------
    # 9 | | | | | | | | | | |
    #   ---------------------
    assert_equal('apple',grid.grid[5][5].token.to_s)
    assert_equal('pear',grid.grid[4][6].token.to_s)
    assert_equal('banana',grid.grid[6][4].token.to_s)
  end

  def test_lay_it_all_out
    arr = Arranger.new({'apple'=>10000, 'pear'=>1000, 'banana'=>100, 'plum'=>10,'peach'=>10,'cherry'=>10}, @text_size, @max_font_em)
    grid = LayoutGrid.new(10,10)
    grid = arr.lay_it_out(grid)
    # Expected looks like this:
    #    
    #    0 1 2 3 4 5 6 7 8 9
    #   ---------------------
    # 0 | | | | | | | | | | |
    #   ---------------------
    # 1 | | | | | | | | | | |
    #   ---------------------
    # 2 | | | | |cherry | | |
    #   ---------------------
    # 3 | | | | | | |plum | |
    #   ---------------------
    # 4 | | | | | | |pear | |
    #   ---------------------
    # 5 | | | | | |apple| | |
    #   ---------------------
    # 6 | | | | |banana | | |
    #   ---------------------
    # 7 | | | |peach| | | | |
    #   ---------------------
    # 8 | | | | | | | | | | |
    #   ---------------------
    # 9 | | | | | | | | | | |
    #   ---------------------
    assert_equal('apple',grid.grid[5][5].token.to_s)
    assert_equal('pear',grid.grid[4][6].token.to_s)
    assert_equal('banana',grid.grid[6][4].token.to_s)
    assert_equal('plum',grid.grid[3][6].token.to_s)
    assert_equal('peach',grid.grid[7][3].token.to_s)
    assert_equal('cherry',grid.grid[2][4].token.to_s)
  end
end
