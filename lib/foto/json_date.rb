class Foto::JsonDate
  attr_accessor :date

  def initialize(date)
    @date = date
  end

  def to_json
    format = "\"\\/Date(%s)\\/\""
    format % [date.strftime("%s%z")]
  end
end
