module Foto
  class Consumer
    attr_accessor :api_key

    def self.url
      raise NotImplementedError.new('You must implement self.url')
    end

    def self.http_verb_class
      Foto::Requests::Put
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
      put = self.class.http_verb_class.new(self, as_json)
      put.run
    end
  end
end
