module Foto
  class Artifact < Foto::Consumer
    ATTRIBUTES = [
      :external_episode_id,
    ]

    attr_accessor *ATTRIBUTES

    class << self
      def attributes
        ATTRIBUTES
      end

      def url
        'artifact2'
      end

      def http_verb_class
        Foto::Requests::Get
      end
    end

    def as_json
      ''
    end

    def uri_id
      "episode/#{external_episode_id}"
    end
  end
end
