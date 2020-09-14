require 'spec_helper'

describe Foto::EpisodeSetup do
  let(:episode_setup) { Foto::EpisodeSetup.new }
  let(:initialized_episode_setup) { Foto::EpisodeSetup.new(episode_setup_attributes) }
  let(:episode_setup_attributes) do
    {
      user_name: 'Chris',
      patient_identifier: '00001',
      clinic_alias: 'clinicalias',
      clinician_alias: 'clinicianalias',
      care_type: -1,
      body_part: -1,
      payer_source: -1,
      visit_number: 1,
      impairment: -1,
      surgery_type: -1,
      optional_surveys: [1,2]
    }
 end

  it 'should have accessors for each attribute' do
    Foto::EpisodeSetup.attributes.each do |attribute|
      expect(episode_setup).to respond_to(attribute)
    end
  end

  it 'accepts an initial hash of attributes' do
    episode_setup_attributes.each do |k, v|
      expect(v).to be_truthy
      expect(initialized_episode_setup.send(k)).to eql(v)
    end
  end

  it 'should be a PartnerAccess request' do
    expect(Foto::EpisodeSetup.http_verb_class).to be(Foto::Requests::PartnerAccessPost)
  end

  describe '#as_json' do
    it 'returns a JSON hash of attributes' do
      expected = {
        'Username'          => initialized_episode_setup.user_name,
        'PatientIdentifier' => initialized_episode_setup.patient_identifier,
        'ClinicAlias'       => initialized_episode_setup.clinic_alias,
        'ClinicianAlias'    => initialized_episode_setup.clinician_alias,
        'CareType'          => initialized_episode_setup.care_type,
        'BodyPart'          => initialized_episode_setup.body_part,
        'PayerSource'       => initialized_episode_setup.payer_source,
        'VisitNumber'       => initialized_episode_setup.visit_number,
        'Impairment'        => initialized_episode_setup.impairment,
        'SurgeryType'       => initialized_episode_setup.surgery_type,
        'OptionalSurveys'   => initialized_episode_setup.optional_surveys
      }
      expect(Yajl::Parser.parse(initialized_episode_setup.as_json)).to eq(expected)
    end
  end

  describe '#save' do
    let(:request) { double :request }
    it 'makes a request to FOTO' do
      expect(Foto::Requests::PartnerAccessPost).to receive(:new).and_return(request)
      expect(request).to receive(:run)
      initialized_episode_setup.save
    end
  end

  describe '.url' do
    it 'returns a partial URL' do
      expect(episode_setup.class.url).to be_truthy
      expect(episode_setup.class.url).to be_an_instance_of(String)
    end
  end
end
