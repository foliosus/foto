require 'foto/config'

module Foto
  class Client
    attr_accessor *Foto::Config::VALID_OPTIONS

    def initialize(options={})
      settings = Foto::Config.options.merge(options)

      Config::VALID_OPTIONS.each do |option|
        send("#{option}=", settings[option])
      end
    end
  end
end
