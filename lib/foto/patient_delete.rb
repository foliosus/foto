module Foto
  class PatientDelete < Foto::Consumer
    ATTRIBUTES = [
      :external_id,
    ]

    attr_accessor *ATTRIBUTES

    class << self
      def attributes
        ATTRIBUTES
      end

      def url
        'patient2'
      end

      def http_verb_class
        Foto::Requests::Delete
      end
    end

    def uri_id
      external_id
    end

    def as_json
      Yajl::Encoder.encode({
        'ExternalId'     => external_id,
      })
    end
  end
end
