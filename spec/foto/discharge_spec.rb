require 'spec_helper'

describe Foto::Discharge do
  let(:discharge) { Foto::Discharge.new }
  let(:initialized_discharge) { Foto::Discharge.new(discharge_attributes) }
  let(:discharge_attributes) do
    {
      clinician_comments:  'Excellent recovery',
      external_episode_id: 'external_episode_id_test',
      interruption_days:   5,
      last_visit:          Time.parse('03/07/2020')
    }
  end

  it 'should have accessors for each attribute' do
    Foto::Discharge.attributes.each do |attribute|
      expect(discharge).to respond_to(attribute)
    end
  end

  it 'accepts an initial hash of attributes' do
    discharge_attributes.each do |k, v|
      expect(v).to be_truthy
      expect(initialized_discharge.send(k)).to eql(v)
    end
  end

  describe '#as_json' do
    let(:last_visit) { Foto::JsonDate.new(initialized_discharge.last_visit).to_json }
    it 'returns a JSON hash of attributes' do
      expected = {
        'ClinicianComments' => initialized_discharge.clinician_comments,
        'ExternalEpisodeId' => initialized_discharge.external_episode_id,
        'InterruptionDays'  => initialized_discharge.interruption_days,
        'LastVisit'         => Yajl::Parser.parse(last_visit),
      }
      expect(Yajl::Parser.parse(initialized_discharge.as_json)).to eq(expected)
    end
  end

  describe '#save' do
    let(:request) { double :request }
    it 'makes a request to FOTO' do
      expect(Foto::Requests::Post).to receive(:new).and_return(request)
      expect(request).to receive(:run)
      initialized_discharge.save
    end
  end

  describe '.url' do
    it 'returns a partial URL' do
      expect(discharge.class.url).to be_truthy
      expect(discharge.class.url).to be_an_instance_of(String)
    end
  end
end
