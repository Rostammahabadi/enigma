class Enigma
	attr_reader :character_set, :message, :key, :date

	def initialize()
		@character_set = ("a".."z").to_a << " "
	end

  def encrypt(message, key = generate_random_key, date = generate_date_today)
		@message = message.downcase.split("")
		@key = key
		@date = date
		encode
	end

  def generate_random_key
    rand(5 ** 5).to_s.rjust(5,'0')
  end

	def generate_date_today
		Date.today.strftime("%d%m%y")
	end

  def encode
    new_key = Key.new(key)
    new_key.create_keys
    offset = Offset.new(date)
    offset.create_offset
    shift = Shift.new(new_key,offset)
    shift.final_shift
    starting_indexes = get_starting_indices
    create_return_hash(generate_encoded_message(starting_indexes,shift))
  end

	def create_return_hash(encoded_message)
		return_hash = {}
		return_hash[:encryption] = encoded_message
		return_hash[:date] = @date
		return_hash[:key] = @key
		return_hash
	end

  def get_starting_indices
    message.map do |letter|
      character_set.find_index(letter)
    end
  end

  def generate_encoded_message(array_of_indexes,shifts)
    encoded_message = []
    array_of_indexes.each.with_index do |char, index|
      if char == nil
        encoded_message << message[index]
        next
      end
      #think about renaming shifts
      final_shift = char + shifts.shifts[index%4] # decode change add to sub
      encoded_message << character_set.rotate(final_shift)[0]
    end
    encoded_message.join
  end

	def decrypt(message, key = generate_random_key, date = generate_date_today)
		@message = message.downcase.split("")
		@key = key
		@date = date
		decode
	end

	def decode
	    new_key = Key.new(key)
	    new_key.create_keys
	    offset = Offset.new(date)
	    offset.create_offset
	    shift = Shift.new(new_key,offset)
	    shift.final_shift
	    starting_indexes = get_starting_indices
	    create_return_hash(decode_message(starting_indexes,shift))
  end

	def decode_message(array_of_indexes, shifts)
		decoded_message = []
		array_of_indexes.each.with_index do |char, index|
			if char == nil
				decoded_message << message[index]
				next
			end
			final_shift = char - shifts.shifts[index%4]
			decoded_message << character_set.rotate(final_shift)[0]
		end
		decoded_message.join
	end

end
