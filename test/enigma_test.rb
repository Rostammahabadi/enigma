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

  def test_it_encodes_single_characters
		new_enigma = Enigma.new
		new_enigma.encrypt("A", "02715", "040895")
		assert_equal "d", new_enigma.encode
	end

  # def test_it_can_encrypt_with_key_and_date
	# 	skip
	# 	enigma = Enigma.new

	# 	assert_equal ({encryption: "keder ohulw", key: "02715", date: "040895"}), enigma.encrypt("hello world", "02715", "040895")
	# end

	# def test_it_can_decrypt_with_key_and_date
	# 	skip
	# 	enigma = Enigma.new

	# 	assert_equal {decryption: "hello world", key: "02715", date: "040895"}, enigma.decrypt("keder ohulw", "02715", "040895")
	# end

	# def test_it_can_encrypt_with_key_using_todays_date
	# 	skip
	# 	enigma = Enigma.new

	# 	assert_equal "encryption hash here", encrypted = enigma.encrypt("hello world", "02715")
	# end

end
