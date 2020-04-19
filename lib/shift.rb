class Shift
  attr_reader :a_shift, :b_shift, :c_shift, :d_shift, :key, :offset, :shifts

  # def initialize(key, offset)
  #   @key = key
  #   @offset = offset
  #   @a_shift = 0
  #   @b_shift = 0
  #   @c_shift = 0
  #   @d_shift = 0
  # end

  def initialize(key, offset)
    @key = key
    @offset = offset
    @shifts = []
  end

  def final_shift
    @shifts << @offset.aoffset + @key.akey
		@shifts << @offset.boffset + @key.bkey
		@shifts << @offset.coffset + @key.ckey
		@shifts << @offset.doffset + @key.dkey
  end

  #
  # def final_shift
	# 	@a_shift = @offset.aoffset + @key.akey
	# 	@b_shift = @offset.boffset + @key.bkey
	# 	@c_shift = @offset.coffset + @key.ckey
	# 	@d_shift = @offset.doffset + @key.dkey
	# end

end
