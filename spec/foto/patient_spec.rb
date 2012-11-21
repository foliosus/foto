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
      :date_of_birth => Time.parse('03/07/1983'),
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
    let(:date_of_birth) { Foto::JsonDate.new(initialized_patient.date_of_birth).to_json }
    it 'returns a JSON hash of attributes' do
      Yajl::Parser.parse(initialized_patient.as_json).should == {
        'FirstName'   => initialized_patient.first_name,
        'LastName'    => initialized_patient.last_name,
        'DateOfBirth' => Yajl::Parser.parse(date_of_birth),
        'Email'       => initialized_patient.email,
        'Gender'      => initialized_patient.gender,
        'Language'    => initialized_patient.language,
        'ExternalId'  => initialized_patient.external_id
      }
    end
  end

  describe '#save' do
    it 'creates a Put request' do
      pending
    end
  end

  describe '.url' do
    it 'returns a partial URL' do
      patient.class.url.should_not be_nil
      patient.class.url.should be_an_instance_of(String)
    end
  end
end
