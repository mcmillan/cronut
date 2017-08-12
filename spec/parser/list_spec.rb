require 'spec_helper'

describe Cronut::Parser::List do
  describe '#initialize' do
    context 'with a non-integer value included in list' do
      it 'raises an ArgumentError' do
        expect { described_class.new(segment: '1,cheese,3', minimum: 1, maximum: 5) }.to raise_error(ArgumentError)
      end
    end

    context 'with a value outside of the minimum and maximum included in list' do
      it 'raises an ArgumentError' do
        expect { described_class.new(segment: '1000,2000', minimum: 1, maximum: 5) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#possibilities' do
    subject { described_class.new(segment: '1,2,3', minimum: 1, maximum: 5) }

    it 'returns an array of the supplied integers' do
      expect(subject.possibilities).to eq([1, 2, 3])
    end
  end
end
