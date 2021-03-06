require 'simplecov'
SimpleCov.start
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
require './lib/encryptor'
require './lib/decryptor'

class EnigmaTest < MiniTest::Test

	def test_it_exists
		enigma = Enigma.new
		assert_instance_of Enigma, enigma
	end

  def test_it_can_encode

		new_enigma = Enigma.new
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
    expected = {:decryption=>"hello world", :date=>"040895", :key=>"02715"}

		assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
	end

  def test_it_can_decrypt_a_message_using_todays_date
		Date.stubs(:strftime).returns(Date.new(2020,4,20))
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world", "02715")
    expected = {:decryption=>"hello world", :date=>"200420", :key=>"02715"}

    assert_equal expected, enigma.decrypt(encrypted[:encryption], "02715")
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
    Date.stubs(:today).returns(Date.new(1995,8,4))
    enigma = Enigma.new
    enigma.stubs(:generate_random_key).returns("02715")
    expected = ({:encryption=>"keder ohulw", :date=>"040895", :key=>"02715"})

    assert_equal expected, enigma.encrypt("hello world")
  end

	def test_it_can_encrypt_message_with_characters_outside_set
		new_enigma = Enigma.new
		expected = {:encryption=>"!@", :date=>"040895", :key=>"02715"}

		assert_equal expected, new_enigma.encrypt("!@", "02715", "040895")
	end

	def test_it_can_generate_random_number_with_length_of_five
		new_enigma = Enigma.new
		assert_equal 5, new_enigma.generate_random_key.length
	end

end
