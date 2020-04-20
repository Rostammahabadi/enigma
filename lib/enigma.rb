class Enigma
	attr_reader :message, :date, :key

	def initialize()
	end

  def encrypt(message, key = generate_random_key, date = generate_date_today)
		@key = key
		@message = message
		@date = date
		new_encryptor = Encryptor.new(message, key, date)
		new_encryptor.generate_encoded_message
	end

	def decrypt(message, key = generate_random_key, date = generate_date_today)
		new_decryptor = Decryptor.new(message, key, date)
		new_decryptor.generate_decoded_message
	end

  def generate_random_key
    rand(5 ** 5).to_s.rjust(5,'0')
  end

	def generate_date_today
		Date.today.strftime("%d%m%y")
	end

	# def crack(message, date = generate_date_today)
	# 	@message = message.downcase.split("")
	# 	@date = date
	# 	crack_message
	# end
	#
	# def crack_message
	# 	starting_indexes = get_starting_indices
	# 	binding.pry
	# 	offset = Offset.new(date)
	# 	offset.create_offset
	# end
end
