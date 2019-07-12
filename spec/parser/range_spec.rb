# frozen_string_literal: true

require 'spec_helper'

describe Cronut::Parser::Range do
  describe '#initialize' do
    context 'with a non-integer start or end' do
      it 'raises an ArgumentError' do
        expect { described_class.new(segment: '1-cheese', minimum: 1, maximum: 5) }.to raise_error(ArgumentError)
      end
    end

    context 'with a start or end outside of the minimum and maximum' do
      it 'raises an ArgumentError' do
        expect { described_class.new(segment: '1000-2000', minimum: 1, maximum: 5) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#possibilities' do
    subject { described_class.new(segment: '1-3', minimum: 1, maximum: 5) }

    it 'returns an array of all integers between start and end of range' do
      expect(subject.possibilities).to eq([1, 2, 3])
    end
  end
end
