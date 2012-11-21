module Foto
  class Patient
    ATTRIBUTES = [ :external_id, :first_name, :last_name,
      :email, :date_of_birth, :gender, :language ]

    attr_accessor *ATTRIBUTES

    def self.attributes
      ATTRIBUTES
    end

    def self.url
      'patient'
    end

    def initialize(attributes={})
      attributes.each do |k, v|
        send("#{k}=", v)
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

    def save
      Foto::Requests::Put.new(self.class.url, as_json).run
    end
  end
end
