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

class EncryptorTest < MiniTest::Test

  def test_it_exists
    assert_instance_of Encryptor, Encryptor.new("abcd", "01824", "190420")
  end

  def test_it_has_attributes
    new_encryptor = Encryptor.new("abcd", "01824", "190420")

    assert_equal "abcd", new_encryptor.message
    assert_equal "01824", new_encryptor.key
    assert_equal "190420", new_encryptor.date
    assert_equal [], new_encryptor.encoded_message
    assert_equal 27, new_encryptor.character_set.length
  end

  def test_it_can_get_shifts
    new_encryptor = Encryptor.new("hello world!", "02715", "040895")

    assert_equal [3, 27, 73, 20], new_encryptor.get_shifts
  end

  def test_it_can_get_starting_indices
  new_encryptor = Encryptor.new("hello world!", "02715", "040895")
  expected = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3, nil]

  assert_equal expected, new_encryptor.get_starting_indices
  end

  def test_it_can_generate_encoded_message
    new_encryptor = Encryptor.new("hello world!", "02715", "040895")
    expected = {:encryption=>"keder ohulw!", :date=>"040895", :key=>"02715"}

    assert_equal expected, new_encryptor.generate_encoded_message
  end

  def test_encoding_method
    new_encryptor = Encryptor.new("hello world!", "02715", "040895")
    indexes = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3, nil]
    shifts = [3, 27, 73, 20]

    assert_equal "keder ohulw!", new_encryptor.encoding(indexes,shifts)
  end

  def test_create_return_hash
    new_encryptor = Encryptor.new("hello world!", "02715", "040895")
    new_encryptor.stubs(:key).returns("02715")
    new_encryptor.stubs(:date).returns("040895")
    expected = {:encryption=>"keder ohulw!", :date=>"040895", :key=>"02715"}

    assert_equal expected, new_encryptor.create_return_hash("keder ohulw!","encryption")
  end

end
