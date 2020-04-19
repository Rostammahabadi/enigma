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

end
