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

end
