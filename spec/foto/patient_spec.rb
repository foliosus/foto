require 'spec_helper'

describe Foto::Patient do
  let(:patient) { Foto::Patient.new }

  it 'should have accessors for each attribute' do
    Foto::Patient.attributes.each do |attribute|
      patient.should respond_to(attribute)
    end
  end
end
