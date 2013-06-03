require 'helper'
require 'pubcloud/ignored_list'

class TestIgnoredList < Test::Unit::TestCase
  def setup
    @list = IgnoredList.new('data/ignored_words.txt')
  end

  def test_ignore
    assert(@list.ignore?('said'),'said should be ignored')
    assert(!@list.ignore?('developer'), 'developer should not be ignored')
  end

end
