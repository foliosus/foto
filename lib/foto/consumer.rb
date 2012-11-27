module Foto
  class Consumer
    attr_accessor :api_key


    def self.url
      raise NotImplementedError.new('You must implement self.url')
    end

    def initialize(attributes={})
      attributes.each do |k, v|
        send("#{k}=", v)
      end
    end

    def as_json
      raise NotImplementedError.new('You must implement as_json')
    end

    def save
      Foto::Requests::Put.new(self, as_json).run
    end
  end
end
