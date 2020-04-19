class Enigma
	attr_reader :character_set, :message, :key, :date

	def initialize()
		@character_set = ("a".."z").to_a << " "
	end

  def encrypt(message, key, date= Date.today)
		@message = message.downcase.split("")
		@key = key ||= generate_random_key
		@date = date
	end
  def generate_random_key
    rand(5 ** 5).to_s.rjust(5,'0')
  end

  def encode
    new_key = Key.new(key)
    new_key.create_keys
    offset = Offset.new(date)
    offset.create_offset
    shift = Shift.new(new_key,offset)
    shift.final_shift
    starting_indexes = get_starting_indices
    generate_encoded_message(starting_indexes,shift)
  end

end
