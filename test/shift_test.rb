require 'simplecov'
SimpleCov.start
require 'date'
require './lib/key'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'
require './lib/shift'
require 'pry'

class ShiftTest < MiniTest::Test

  def test_it_exists

    assert_instance_of Shift, Shift.new("02715", "040895")
    assert_instance_of Shift, Shift.new(Key.new('02715'), Offset.new("040895"))
  end

  def test_it_has_attributes

    new_shift = Shift.new("02715", "040895")
    assert_equal '02715', new_shift.key
    assert_equal "040895", new_shift.offset
  end

  def test_it_can_create_offset
    key = Key.new('02715')
    key.create_keys
    offset = Offset.new('040895')
    offset.create_offset
    # offset = mock
    # key.stubs(:akey).returns(02)
    # key.stubs(:bkey).returns(27)
    # key.stubs(:ckey).returns(71)
    # key.stubs(:dkey).returns(15)
    # offset.stubs(:@aoffset).returns(1)
    # offset.stubs(:@boffset).returns(0)
    # offset.stubs(:@coffset).returns(2)
    # offset.stubs(:@doffset).returns(5)
    new_shift = Shift.new(key, offset)
    new_shift.final_shift
    assert_equal [3, 27, 73, 20], new_shift.shifts
  end

end
