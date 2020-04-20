class Shift
  attr_reader :a_shift, :b_shift, :c_shift, :d_shift, :key, :offset, :shifts

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

end
