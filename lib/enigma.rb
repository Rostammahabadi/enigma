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


end
