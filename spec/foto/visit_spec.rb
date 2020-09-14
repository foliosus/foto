require 'spec_helper'

describe Foto::Visit do
  let(:visit) { Foto::Visit.new }
  let(:initialized_visit) { Foto::Visit.new(visit_attributes) }
  let(:visit_attributes) do
    {
      clinician_type: 'PT',
      external_episode_id: '42',
      minutes_spent: 20,
      visit_date: Time.parse('04/01/2020'),
      revenue: 45.0
    }
 end

  it 'should have accessors for each attribute' do
    Foto::Visit.attributes.each do |attribute|
      expect(visit).to respond_to(attribute)
    end
  end

  it 'accepts an initial hash of attributes' do
    visit_attributes.each do |k, v|
      expect(v).to be_truthy
      expect(initialized_visit.send(k)).to eql(v)
    end
  end

  it 'should not be a PartnerAccess request' do
    expect(Foto::Visit.http_verb_class).to be(Foto::Requests::Post)
  end

  describe '#as_json' do
    let(:visit_date) { Foto::JsonDate.new(initialized_visit.visit_date).to_json }
    it 'returns a JSON hash of attributes' do
      expected = {
        'ClinicianType'     => initialized_visit.clinician_type,
        'ExternalEpisodeId' => initialized_visit.external_episode_id,
        'MinutesSpent'      => initialized_visit.minutes_spent,
        'VisitDate'         => Yajl::Parser.parse(visit_date),
        'Revenue'           => initialized_visit.revenue
      }
      expect(Yajl::Parser.parse(initialized_visit.as_json)).to eq(expected)
    end
  end

  describe '#save' do
    let(:request) { double :request }
    it 'makes a request to FOTO' do
      expect(Foto::Requests::Post).to receive(:new).and_return(request)
      expect(request).to receive(:run)
      initialized_visit.save
    end
  end

  describe '.url' do
    it 'returns a partial URL' do
      expect(visit.class.url).to be_truthy
      expect(visit.class.url).to be_an_instance_of(String)
    end
  end
end
