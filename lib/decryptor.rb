require_relative 'generate_shifts'
require_relative 'hashable'
class Decryptor < GenerateShifts
  include Hashable
  attr_reader :message, :key, :date, :decoded_message, :character_set

  def initialize(message, key, date)
    @message = message.downcase
    @key = key
    @date = date
    @decoded_message= []
    @character_set = ("a".."z").to_a << " "
  end

  def get_starting_indices
    message.split("").map do |letter|
      character_set.find_index(letter)
    end
  end

  def decoding(array_of_indexes, shifts)
    decoded_message = []
    array_of_indexes.each.with_index do |char, index|
      if char == nil
        decoded_message << message[index]
        next
      end
      final_shift = char - shifts[index%4]
      decoded_message << character_set.rotate(final_shift)[0]
    end
    decoded_message.join
  end

  def generate_decoded_message
    array_of_indexes = get_starting_indices
    shifts = get_shifts
		create_return_hash(decoding(array_of_indexes, shifts),"decryption")
	end

end
