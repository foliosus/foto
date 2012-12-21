class Foto::JsonDate
  attr_accessor :date

  def initialize(date)
    @date = date
  end

  def to_json
    format = "\"\\/Date(%s)\\/\""
    seconds = date.to_i * 1000
    format % [seconds]
  end
end
