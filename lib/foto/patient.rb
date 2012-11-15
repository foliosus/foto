module Foto
  class Patient
    ATTRIBUTES = {
      :external_id   => 'ExternalID',
      :first_name    => 'FirstName',
      :last_name     => 'LastName',
      :email         => 'Email',
      :date_of_birth => 'DateOfBirth',
      :gender        => 'Gender',
      :language      => 'Language'
    }

    attr_accessor *ATTRIBUTES.keys

    def initialize(attributes={})
      attributes.each do |k, v|
        send("#{k}=", v)
      end
    end

    # Class methods
    def self.attributes
      ATTRIBUTES.keys
    end

    def clean_date_of_birth
      case date_of_birth
      when String
        Date.parse(date_of_birth).strftime('%Y-%m-%d')
      when Date
        date_of_birth.strftime('%Y-%m-%d')
      end
    end

    # Instance methods
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
