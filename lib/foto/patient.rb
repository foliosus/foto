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

    # Class methods
    def self.attributes
      ATTRIBUTES.keys
    end

    # Instance methods
    def to_json
      {
        'FirstName'   => patient.first_name,
        'LastName'    => patient.last_name,
        'DateOfBirth' => patient.birth_date.iso8601,
        'Email'       => patient.email,
        'Gender'      => patient.gender,
        'Language'    => 'en',
        'ExternalId'  => external_id
      }.to_json
    end
  end
end
