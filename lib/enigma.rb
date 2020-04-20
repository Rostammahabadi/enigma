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

end
