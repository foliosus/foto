module Foto
  class Episode < Foto::Consumer
    ATTRIBUTES = [
      :patient_identifier,
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
      patient_identifier
    end
  end
end
