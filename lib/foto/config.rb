module Foto

  def self.configure
    yield Config
  end

  module Config
    module Defaults
      API_KEY = 'placeholder'
      BASE_URI = 'http://devs.patient-inquiry.com'
      PROTOCOL = 'http'
    end

    extend self

    VALID_OPTIONS = [:api_key, :base_uri, :protocol]

    attr_accessor *VALID_OPTIONS

    def reset!
      self.api_key = Defaults::API_KEY
      self.base_uri = Defaults::BASE_URI
      self.protocol = Defaults::PROTOCOL
    end

    def options
      Hash[ *VALID_OPTIONS.map {|option| [option, send(option)]}.flatten ]
    end
  end
end
