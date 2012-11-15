module Foto
  module Config
    module Defaults
      API_KEY = 'placeholder'
      PATIENTS_URI = 'http://devs.patient-inquiry.com/patient/json'
    end

    extend self

    VALID_OPTIONS = [:api_key, :patients_uri]

    attr_accessor *VALID_OPTIONS

    def reset!
      self.api_key = Defaults::API_KEY
      self.patients_uri = Defaults::PATIENTS_URI
    end

    def options
      Hash[ *VALID_OPTIONS.map {|option| [option, send(option)]}.flatten ]
    end

    def configure
      yield self
    end
  end
end
