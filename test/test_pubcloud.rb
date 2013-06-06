require 'helper'
require 'pubcloud'

class TestPubcloud < Test::Unit::TestCase

  def test_init_nothing_raised
    opts = {}
    assert_nothing_raised do
      Pubcloud::Pubcloud.new(opts)
    end
  end

  def test_freqs_gettysburg
    exp = '{"nation"=>5, "dedicated"=>6, "living"=>3, "dead"=>3, "person"=>3}'
    opts = {:file => 'test/data/gettysburg.txt', :min => 3, :use_ignores => true}
    assert_equal(exp, Pubcloud::Pubcloud.new(opts).freqs.to_s)
  end

  #def test_cli
  #  exp =  '{"nation"=>5, "dedicated"=>6, "living"=>3, "dead"=>3, "person"=>3}' << "\n"
  #  actual = `./bin/pubcloud --file=test/data/gettysburg.txt --min=3 --use-ignores=true`
  #  assert_equal(exp,actual,"CLI not working as expected")
  #end
end
