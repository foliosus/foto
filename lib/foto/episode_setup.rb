module Foto
  class EpisodeSetup < Foto::Consumer
    ATTRIBUTES = [
      :user_name,
      :patient_identifier,
      :clinic_alias,
      :clinician_alias,
      :care_type,
      :body_part,
      :payer_source,
      :visit_number,
      :impairment,
      :surgery_type,
      :optional_surveys
    ]

    attr_accessor *ATTRIBUTES

    class << self
      def attributes
        ATTRIBUTES
      end

      def url
        'EpisodeSetup'
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
        'Username'          => user_name,
        'PatientIdentifier' => patient_identifier,
        'ClinicAlias'       => clinic_alias,
        'ClinicianAlias'    => clinician_alias,
        'CareType'          => care_type || -1,
        'BodyPart'          => body_part || -1,
        'PayerSource'       => payer_source || -1,
        'VisitNumber'       => visit_number || 1,
        'Impairment'        => impairment || -1,
        'SurgeryType'       => surgery_type || -1,
        'OptionalSurveys'   => optional_surveys || []
      })
    end
  end
end
