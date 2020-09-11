module Foto
  class EpisodeSurveyUrl < Foto::Consumer
    ATTRIBUTES = [
      :episode_id,
    ]

    attr_accessor *ATTRIBUTES

    class << self
      def attributes
        ATTRIBUTES
      end

      def url
        'episode'
      end

      def http_verb_class
        Foto::Requests::Get
      end
    end

    def as_json
      ''
    end

    def uri_id
      "SurveyURL/#{episode_id}"
    end
  end
end
