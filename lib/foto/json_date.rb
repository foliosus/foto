class Foto::JsonDate
  attr_accessor :date

  def initialize(date)
    @date = date
  end

  def to_json
    format = "\"\\/Date(%s%s)\\/\""
    seconds = date.to_i * 1000
    format % [seconds, date.strftime("%z")]
  end
end
