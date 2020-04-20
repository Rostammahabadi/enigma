class GenerateShifts

  def get_shifts
    new_key = Key.new(key)
    new_key.create_keys
    offset = Offset.new(date)
    offset.create_offset
    shift = Shift.new(new_key,offset)
    shift.final_shift
  end

end
