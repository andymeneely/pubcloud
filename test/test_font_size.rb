require 'helper'
require 'pubcloud/font_size'

class TestFontSize < Test::Unit::TestCase

  def test_abc_rockwell
    font_size = FontSize.new('rockwell')
    assert_equal(28.3, font_size.width_of('abc'))
  end

  def test_abc_rockwell_height
    font_size = FontSize.new('rockwell')
    assert_equal(18.9, font_size.height)
  end

  def test_unsupported_font
    assert_raise FontSize::UnsupportedFont do 
      font_size = FontSize.new('calibri')
    end
  end
end
