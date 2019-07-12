# frozen_string_literal: true

require 'spec_helper'

describe Cronut::Parser::Any do
  describe '#possibilities' do
    subject { described_class.new(segment: '*', minimum: 1, maximum: 5) }

    it 'returns all integer values between supplied minimum to maximum' do
      expect(subject.possibilities).to eq([1, 2, 3, 4, 5])
    end
  end
end
