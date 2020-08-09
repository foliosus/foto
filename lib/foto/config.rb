module Foto

  def self.configure
    yield Config
  end

  module Config
    module Defaults
      API_KEY = 'placeholder'
      BASE_API_URI = 'http://devs.patient-inquiry.com'
      BASE_UI_URI = 'http://staging.fotoinc.com'
    end

    extend self

    VALID_OPTIONS = [:api_key, :base_api_uri, :base_ui_uri]

    attr_accessor *VALID_OPTIONS

    def reset!
      self.api_key = Defaults::API_KEY
      self.base_api_uri = Defaults::BASE_API_URI
      self.base_ui_uri = Defaults::BASE_UI_URI
    end

    def options
      Hash[ *VALID_OPTIONS.map {|option| [option, send(option)]}.flatten ]
    end
  end
end
