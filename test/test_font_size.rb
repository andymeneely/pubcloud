require 'helper'
require 'pubcloud/font_size'

class TestFontSize < Test::Unit::TestCase

  def test_abc_rockwell
    font_size = FontSize.new(:rockwell)
    assert_equal(37.7, font_size.of('abc'))
  end
end
