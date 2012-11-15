require 'spec_helper'

describe Foto::Patient do
  let(:patient) { Foto::Patient.new }
  let(:initialized_patient) { Foto::Patient.new(patient_attributes) }
  let(:patient_attributes) do
    {
      :external_id   => 'external_id_test',
      :first_name    => 'Bob',
      :last_name     => 'Bobson',
      :email         => 'bob.bobson@bobbobson.com',
      :date_of_birth => Date.parse('03/07/1983'),
      :gender        => 'M',
      :language      => 'en'
    }
  end

  it 'should have accessors for each attribute' do
    Foto::Patient.attributes.each do |attribute|
      patient.should respond_to(attribute)
    end
  end

  it 'accepts an initial hash of attributes' do
    patient_attributes.each do |k, v|
      v.should_not be_nil
      initialized_patient.send(k).should eql(v)
    end
  end

  describe '#as_json' do
    it 'returns a JSON hash of attributes' do
      JSON.parse(initialized_patient.as_json).should == {
        'FirstName'   => initialized_patient.first_name,
        'LastName'    => initialized_patient.last_name,
        'DateOfBirth' => initialized_patient.clean_date_of_birth,
        'Email'       => initialized_patient.email,
        'Gender'      => initialized_patient.gender,
        'Language'    => initialized_patient.language,
        'ExternalId'  => initialized_patient.external_id
      }
    end
  end
end
