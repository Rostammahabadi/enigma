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
require './lib/decryptor'

class DecryptorTest < MiniTest::Test

  def test_it_exists
    assert_instance_of Decryptor, Decryptor.new("keder ohulw!", "01824", "190420")
  end

  def test_it_has_attributes

    new_decryptor = Decryptor.new("keder ohulw!", "01824", "190420")

    assert_equal "keder ohulw!", new_decryptor.message
    assert_equal "01824", new_decryptor.key
    assert_equal "190420", new_decryptor.date
    assert_equal [], new_decryptor.decoded_message
    assert_equal 27, new_decryptor.character_set.length
  end

  def test_it_can_get_shifts
    new_decryptor = Decryptor.new("keder ohulw!", "02715", "040895")

    assert_equal [3, 27, 73, 20], new_decryptor.get_shifts
  end

  def test_it_can_get_starting_indices
  new_decryptor = Decryptor.new("keder ohulw!", "02715", "040895")
  expected = [10, 4, 3, 4, 17, 26, 14, 7, 20, 11, 22, nil]

  assert_equal expected, new_decryptor.get_starting_indices
  end

  def test_it_can_generate_decoded_message
    new_decryptor = Decryptor.new("keder ohulw!", "02715", "040895")
    expected = {:decryption=>"hello world!", :date=>"040895", :key=>"02715"}

    assert_equal expected, new_decryptor.generate_decoded_message
  end

  def test_decoding_method
    new_decryptor = Decryptor.new("keder ohulw!", "02715", "040895")
    indexes = [10, 4, 3, 4, 17, 26, 14, 7, 20, 11, 22, nil]
    shifts = [3, 27, 73, 20]

    assert_equal "hello world!", new_decryptor.decoding(indexes,shifts)
  end

  def test_create_return_hash
    new_decryptor = Decryptor.new("keder ohulw!", "02715", "040895")
    new_decryptor.stubs(:key).returns("02715")
    new_decryptor.stubs(:date).returns("040895")
    expected = {:encryption=>"hello world!", :date=>"040895", :key=>"02715"}

    assert_equal expected, new_decryptor.create_return_hash("hello world!","encryption")
  end

end
