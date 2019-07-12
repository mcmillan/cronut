# frozen_string_literal: true

require 'spec_helper'

describe Cronut::Parser::Exact do
  describe '#initialize' do
    context 'with a non-integer segment' do
      it 'raises an ArgumentError' do
        expect { described_class.new(segment: 'cheese', minimum: 1, maximum: 2) }.to raise_error(ArgumentError)
      end
    end

    context 'with a value outside of minimum and maximum' do
      it 'raises an ArgumentError' do
        expect { described_class.new(segment: '100', minimum: 1, maximum: 2) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#possibilities' do
    subject { described_class.new(segment: '2', minimum: 1, maximum: 5) }

    it 'returns the supplied integer as a single element in an array' do
      expect(subject.possibilities).to eq([2])
    end
  end
end
