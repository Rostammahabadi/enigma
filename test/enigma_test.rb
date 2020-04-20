require 'date'
require './lib/enigma'
require './lib/key'
require './lib/offset'
require './lib/shift'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha'
require 'pry'
require 'mocha/minitest'

class EnigmaTest < MiniTest::Test

	def test_it_exists
		enigma = Enigma.new
		assert_instance_of Enigma, enigma
	end

  def test_it_can_encode

		new_enigma = Enigma.new
		#new_enigma.encrypt("hello world!", "02715", "040895")
    expected = {:encryption=>"keder ohulw!", :date=>"040895", :key=>"02715"}
		assert_equal expected, new_enigma.encrypt("hello world!", "02715", "040895")
    expected = {:encryption=>"hxda", :date=>"190420", :key=>"01824"}
		assert_equal expected, new_enigma.encrypt("abcd", "01824", "190420")
	end

  def test_it_encodes_single_characters
		new_enigma = Enigma.new
    expected = {:encryption=>"d", :date=>"040895", :key=>"02715"}
		assert_equal expected, new_enigma.encrypt("A", "02715", "040895")
	end

	def test_it_can_decrypt_with_key_and_date

		enigma = Enigma.new
    expected = {:encryption=>"hello world", :date=>"040895", :key=>"02715"}
		assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
	end

  def test_it_can_encrypt
    enigma = Enigma.new
    expected = {encryption: "vjqtbeaweqihssi", key: "08304", date: "291018"}
    assert_equal expected, enigma.encrypt("hello world end", "08304", "291018")
  end

  def test_encrypt_a_message_with_a_key_using_todays_date
    Date.stubs(:today).returns(Date.new(1995,8,4))
    enigma = Enigma.new
    expected = ({:encryption=>"keder ohulw", :date=>"040895", :key=>"02715"})
    assert_equal expected, enigma.encrypt("hello world", "02715")
  end

  def test_encrypt_a_message_with_a_message_and_no_key_or_date
    skip
    Enigma.stubs(:rjust).returns("02715")
    Date.stubs(:today).returns(Date.new(1995,8,4))
    enigma = Enigma.new
    enigma.encrypt("hello world")
    assert_equal ({:encryption=>"keder ohulw", :date=>"040895", :key=>"02715"}), enigma.encode
  end

end
