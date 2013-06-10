require 'helper'
require 'pubcloud/text_size'

class TestTextSize < Test::Unit::TestCase

  def test_abc_rockwell
    text_size = TextSize.new('rockwell')
    assert_equal(28.3, text_size.px_width_of('abc'))
  end

  def test_abc_rockwell_height
    text_size = TextSize.new('rockwell')
    assert_equal(18.9, text_size.px_height)
  end

  def test_unsupported_font
    assert_raise TextSize::UnsupportedFont do 
      text_size = TextSize.new('calibri')
    end
  end

  def test_em_conversion
    text_size = TextSize.new('rockwell', 4)
    assert_equal(5, text_size.em_width_of('bd'))
  end
end
