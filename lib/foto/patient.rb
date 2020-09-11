module Foto
  class Patient < Foto::Consumer
    ATTRIBUTES = [
      :external_id,
      :external_site_id,
      :first_name,
      :middle_initial,
      :last_name,
      :alias,
      :email,
      :date_of_birth,
      :gender,
      :language
    ]

    attr_accessor *ATTRIBUTES

    class << self
      def attributes
        ATTRIBUTES
      end

      def url
        'patient2'
      end
    end

    def uri_id
      nil
    end

    def as_json
      Yajl::Encoder.encode({
        'FirstName'      => first_name,
        'LastName'       => last_name,
        'MiddleInitial'  => middle_initial,
        'Alias'          => self.alias,
        'DateOfBirth'    => Foto::JsonDate.new(date_of_birth),
        'Email'          => email,
        'Gender'         => gender,
        'Language'       => language || 'en',
        'ExternalId'     => external_id,
        'ExternalSiteId' => external_site_id
      })
    end
  end
end
