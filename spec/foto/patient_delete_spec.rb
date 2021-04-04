require 'spec_helper'

describe Foto::PatientDelete do
  let(:patient) { Foto::PatientDelete.new }
  let(:initialized_patient) { Foto::PatientDelete.new(patient_attributes) }
  let(:patient_attributes) do
    {
      external_id: 'external_id_test',
    }
  end

  it 'should have accessors for each attribute' do
    Foto::PatientDelete.attributes.each do |attribute|
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
    it 'returns a JSON hash of attributes' do
      expected = {
        'ExternalId'     => initialized_patient.external_id,
      }
      expect(Yajl::Parser.parse(initialized_patient.as_json)).to eq(expected)
    end
  end

  describe '#save' do
    let(:request) { double :request }
    it 'makes a request to FOTO' do
      expect(Foto::Requests::Delete).to receive(:new).and_return(request)
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
