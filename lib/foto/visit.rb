module Foto
  class Visit < Foto::Consumer
    ATTRIBUTES = [
      :clinician_type,
      :external_episode_id,
      :minutes_spent,
      :visit_date,
      :revenue
    ]

    attr_accessor *ATTRIBUTES

    class << self
      def attributes
        ATTRIBUTES
      end

      def url
        'visit2'
      end

      def http_verb_class
        Foto::Requests::Post
      end
    end

    def uri_id
      nil
    end

    def as_json
      Yajl::Encoder.encode({
        'ClinicianType'     => clinician_type,
        'ExternalEpisodeId' => external_episode_id,
        'MinutesSpent'      => minutes_spent,
        'VisitDate'         => Foto::JsonDate.new(visit_date),
        'Revenue'           => revenue
      })
    end
  end
end
