module Foto
  class Patient < Foto::Consumer
    ATTRIBUTES = [ :external_id, :first_name, :last_name,
      :email, :date_of_birth, :gender, :language ]

    attr_accessor *ATTRIBUTES

    class << self
      def attributes
        ATTRIBUTES
      end

      def url
        'patient'
      end
    end

    def as_json
      Yajl::Encoder.encode({
        'FirstName'   => first_name,
        'LastName'    => last_name,
        'DateOfBirth' => Foto::JsonDate.new(date_of_birth),
        'Email'       => email,
        'Gender'      => gender,
        'Language'    => language || 'en',
        'ExternalId'  => external_id
      })
    end
  end
end
