module Foto
  class Discharge < Foto::Consumer
    ATTRIBUTES = [
      :clinician_comments,
      :external_episode_id,
      :interruption_days,
      :last_visit,
    ]

    attr_accessor *ATTRIBUTES

    class << self
      def attributes
        ATTRIBUTES
      end

      def url
        'discharge'
      end
    end

    def uri_id
      nil
    end

    def as_json
      Yajl::Encoder.encode({
        'ClinicianComments' => clinician_comments,
        'ExternalEpisodeId' => external_episode_id,
        'InterruptionDays'  => interruption_days,
        'LastVisit'         => Foto::JsonDate.new(last_visit),
      })
    end
  end
end
