require 'date'
class Offset

  attr_reader :aoffset, :boffset, :coffset, :doffset, :date

  def initialize(date= Date.today)
    @date = date
    @aoffset = 0
    @boffset = 0
    @coffset = 0
    @doffset = 0
  end

end
