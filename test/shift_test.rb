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


end
