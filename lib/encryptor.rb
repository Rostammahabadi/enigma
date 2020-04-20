require_relative 'generate_shifts'
require_relative 'hashable'
class Encryptor < GenerateShifts
  include Hashable
  attr_reader :key, :date, :message, :encoded_message, :character_set

  def initialize(message, key, date)
    @key = key
    @date = date
    @message = message.downcase
    @encoded_message = []
    @character_set = ("a".."z").to_a << " "
  end

  def get_starting_indices
    message.split("").map do |letter|
      character_set.find_index(letter)
    end
  end
# 27-28 into own method (2 args ~ 3)
  def encoding(array_of_indexes, shifts)
    array_of_indexes.each.with_index do |char, index|
      if char == nil
        encoded_message << message[index]
        next
      end
      final_shift = char + shifts[index%4]
      encoded_message << character_set.rotate(final_shift)[0]
    end
    encoded_message.join
  end

  def generate_encoded_message
    array_of_indexes = get_starting_indices
    shifts = get_shifts
    create_return_hash(encoding(array_of_indexes, shifts),"encryption")
  end

end
