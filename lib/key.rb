class Key

  attr_reader :akey, :bkey, :ckey, :dkey, :key

  def initialize(key)
    @key = key
    @akey = 0
    @bkey = 0
    @ckey = 0
    @dkey = 0
  end

  def create_keys
		keys = @key.split("")
		@akey = keys[0..1].join.to_i
		@bkey = keys[1..2].join.to_i
		@ckey = keys[2..3].join.to_i
		@dkey = keys[3..4].join.to_i
	end

end
