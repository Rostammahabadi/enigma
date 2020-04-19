require 'date'
require './lib/offset'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class OffsetTest < MiniTest::Test

  def test_it_exists
    assert_instance_of Offset, Offset.new('040895')
  end

end
