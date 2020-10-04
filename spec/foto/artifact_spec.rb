require 'spec_helper'

describe Foto::Artifact do
  let(:artifact) { Foto::Artifact.new }
  let(:initialized_artifact) { Foto::Artifact.new(artifact_attributes) }
  let(:artifact_attributes) do
    {
      external_episode_id: '12'
    }
  end

  it 'should have accessors for each attribute' do
    Foto::Artifact.attributes.each do |attribute|
      expect(artifact).to respond_to(attribute)
    end
  end

  it 'accepts an initial hash of attributes' do
    artifact_attributes.each do |k, v|
      expect(v).to be_truthy
      expect(initialized_artifact.send(k)).to eql(v)
    end
  end

  it 'has a uri_id' do
    expect(initialized_artifact.uri_id).to eql("episode/#{initialized_artifact.external_episode_id}")
  end

  describe '#as_json' do
    it 'has no JSON hash of attributes' do
      expect(Yajl::Parser.parse(initialized_artifact.as_json)).to eq(nil)
    end
  end

  describe '#save' do
    let(:request) { double :request }
    it 'makes a request to FOTO' do
      expect(Foto::Requests::Get).to receive(:new).and_return(request)
      expect(request).to receive(:run)
      initialized_artifact.save
    end
  end

  describe '.url' do
    it 'returns a partial URL' do
      expect(artifact.class.url).to be_truthy
      expect(artifact.class.url).to be_an_instance_of(String)
    end
  end
end
