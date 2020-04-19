require 'date'
require './lib/enigma'
require './lib/key'
require './lib/offset'
require './lib/shift'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class EnigmaTest < MiniTest::Test

	def test_it_exists
		enigma = Enigma.new
		assert_instance_of Enigma, enigma
	end

  def test_it_can_encode

		new_enigma = Enigma.new
		new_enigma.encrypt("hello world!", "02715", "040895")
		assert_equal "keder ohulw!", new_enigma.encode
		new_enigma.encrypt("abcd", "01824", "190420")
		assert_equal "hxda", new_enigma.encode
	end

end
