require 'date'
require './lib/key'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require 'mocha'
require 'mocha/minitest'

class KeyTest < MiniTest::Test

  def test_it_exists

    assert_instance_of Key, Key.new('02715')
  end

  def test_it_has_attributes
    new_key = Key.new('02715')

    assert_equal '02715', new_key.key
    assert_equal 0, new_key.akey
    assert_equal 0, new_key.bkey
    assert_equal 0, new_key.ckey
    assert_equal 0, new_key.dkey
  end

  def test_it_can_create_keys
    new_key = Key.new('02715')
    new_key.create_keys

    assert_equal 02, new_key.akey
    assert_equal 27, new_key.bkey
    assert_equal 71, new_key.ckey
    assert_equal 15, new_key.dkey
  end

end
