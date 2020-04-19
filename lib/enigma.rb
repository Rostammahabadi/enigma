class Enigma
	attr_reader :character_set, :message, :key, :date

	def initialize()
		@character_set = ("a".."z").to_a << " "
	end

end
