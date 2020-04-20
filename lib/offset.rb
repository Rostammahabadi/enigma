require 'date'
class Offset

  attr_reader :aoffset, :boffset, :coffset, :doffset, :date

  def initialize(date)
    @date = date
    @aoffset = 0
    @boffset = 0
    @coffset = 0
    @doffset = 0
  end
  
  def create_offset
    offset = (date.to_i**2).to_s.split("")
    @aoffset = offset[-4].to_i
    @boffset = offset[-3].to_i
    @coffset = offset[-2].to_i
    @doffset = offset[-1].to_i
  end

end
