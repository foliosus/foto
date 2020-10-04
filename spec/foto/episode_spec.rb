require 'spec_helper'

describe Foto::Episode do
  let(:episode) { Foto::Episode.new }
  let(:initialized_episode) { Foto::Episode.new(episode_attributes) }
  let(:episode_attributes) do
    {
      patient_identifier: '12'
    }
  end

  it 'should have accessors for each attribute' do
    Foto::Episode.attributes.each do |attribute|
      expect(episode).to respond_to(attribute)
    end
  end

  it 'accepts an initial hash of attributes' do
    episode_attributes.each do |k, v|
      expect(v).to be_truthy
      expect(initialized_episode.send(k)).to eql(v)
    end
  end

  it 'has a uri_id' do
    expect(initialized_episode.uri_id).to eql(initialized_episode.patient_identifier)
  end

  describe '#as_json' do
    it 'has no JSON hash of attributes' do
      expect(Yajl::Parser.parse(initialized_episode.as_json)).to eq(nil)
    end
  end

  describe '#save' do
    let(:request) { double :request }
    it 'makes a request to FOTO' do
      expect(Foto::Requests::Get).to receive(:new).and_return(request)
      expect(request).to receive(:run)
      initialized_episode.save
    end
  end

  describe '.url' do
    it 'returns a partial URL' do
      expect(episode.class.url).to be_truthy
      expect(episode.class.url).to be_an_instance_of(String)
    end
  end
end
