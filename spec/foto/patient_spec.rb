require 'spec_helper'

describe Foto::Patient do
  let(:patient) { Foto::Patient.new }
  let(:initialized_patient) { Foto::Patient.new(patient_attributes) }
  let(:patient_attributes) do
    {
      external_id:   'external_id_test',
      first_name:    'Bob',
      last_name:     'Bobson',
      email:         'bob.bobson@bobbobson.com',
      date_of_birth: Time.parse('03/07/1983'),
      gender:        'M',
      language:      'en'
    }
  end

  it 'should have accessors for each attribute' do
    Foto::Patient.attributes.each do |attribute|
      expect(patient).to respond_to(attribute)
    end
  end

  it 'accepts an initial hash of attributes' do
    patient_attributes.each do |k, v|
      expect(v).to be_truthy
      expect(initialized_patient.send(k)).to eql(v)
    end
  end

  describe '#as_json' do
    let(:date_of_birth) { Foto::JsonDate.new(initialized_patient.date_of_birth).to_json }
    it 'returns a JSON hash of attributes' do
      expected = {
        'FirstName'   => initialized_patient.first_name,
        'LastName'    => initialized_patient.last_name,
        'DateOfBirth' => Yajl::Parser.parse(date_of_birth),
        'Email'       => initialized_patient.email,
        'Gender'      => initialized_patient.gender,
        'Language'    => initialized_patient.language,
        'ExternalId'  => initialized_patient.external_id
      }
      expect(Yajl::Parser.parse(initialized_patient.as_json)).to eq(expected)
    end
  end

  describe '#save' do
    let(:request) { double :request }
    it 'makes a request to FOTO' do
      expect(Foto::Requests::Put).to receive(:new).and_return(request)
      expect(request).to receive(:run)
      initialized_patient.save
    end
  end

  describe '.url' do
    it 'returns a partial URL' do
      expect(patient.class.url).to be_truthy
      expect(patient.class.url).to be_an_instance_of(String)
    end
  end
end
