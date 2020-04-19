require 'date'
require './lib/offset'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class OffsetTest < MiniTest::Test

  def test_it_exists
    assert_instance_of Offset, Offset.new('040895')
  end

  def test_it_has_attributes
    new_offset = Offset.new('040895')

    assert_equal '040895', new_offset.date
    assert_equal 0, new_offset.aoffset
    assert_equal 0, new_offset.boffset
    assert_equal 0, new_offset.coffset
    assert_equal 0, new_offset.doffset
  end

end
