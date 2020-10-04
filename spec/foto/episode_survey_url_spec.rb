require 'spec_helper'

describe Foto::EpisodeSurveyUrl do
  let(:episode_survey_url) { Foto::EpisodeSurveyUrl.new }
  let(:initialized_episode_survey_url) { Foto::EpisodeSurveyUrl.new(episode_survey_url_attributes) }
  let(:episode_survey_url_attributes) do
    {
      episode_id: '2042'
    }
  end

  it 'should have accessors for each attribute' do
    Foto::EpisodeSurveyUrl.attributes.each do |attribute|
      expect(episode_survey_url).to respond_to(attribute)
    end
  end

  it 'accepts an initial hash of attributes' do
    episode_survey_url_attributes.each do |k, v|
      expect(v).to be_truthy
      expect(initialized_episode_survey_url.send(k)).to eql(v)
    end
  end

  it 'has a uri_id' do
    expect(initialized_episode_survey_url.uri_id).to eql("SurveyURL/#{initialized_episode_survey_url.episode_id}")
  end

  describe '#as_json' do
    it 'has no JSON hash of attributes' do
      expect(Yajl::Parser.parse(initialized_episode_survey_url.as_json)).to eq(nil)
    end
  end

  describe '#save' do
    let(:request) { double :request }
    it 'makes a request to FOTO' do
      expect(Foto::Requests::Get).to receive(:new).and_return(request)
      expect(request).to receive(:run)
      initialized_episode_survey_url.save
    end
  end

  describe '.url' do
    it 'returns a partial URL' do
      expect(episode_survey_url.class.url).to be_truthy
      expect(episode_survey_url.class.url).to be_an_instance_of(String)
    end
  end
end
