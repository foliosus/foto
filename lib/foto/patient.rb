module Foto
  class Patient
    ATTRIBUTES = [ :external_id, :first_name, :last_name,
      :email, :date_of_birth, :gender, :language ]
    attr_accessor *ATTRIBUTES

    def self.attributes
      ATTRIBUTES
    end

    def initialize(attributes={})
      attributes.each do |k, v|
        send("#{k}=", v)
      end
    end

    def clean_date_of_birth
      case date_of_birth
      when String
        Date.parse(date_of_birth).strftime('%Y-%m-%d')
      when Date
        date_of_birth.strftime('%Y-%m-%d')
      end
    end

    def as_json
      {
        'FirstName'   => first_name,
        'LastName'    => last_name,
        'DateOfBirth' => clean_date_of_birth,
        'Email'       => email,
        'Gender'      => gender,
        'Language'    => language || 'en',
        'ExternalId'  => external_id
      }.to_json
    end
  end
end
