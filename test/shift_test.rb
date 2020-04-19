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
    assert_instance_of Shift, Shift.new(Key.new('02715'), Offset.new)
  end

  def test_it_has_attributes

    new_shift = Shift.new("02715", "040895")
    assert_equal '02715', new_shift.key
    assert_equal "040895", new_shift.offset
  end

end
