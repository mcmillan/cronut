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
    context 'with an array of plain integers' do
      subject { described_class.new(segment: '1,2,3', minimum: 1, maximum: 5) }

      it 'returns an array of the supplied integers' do
        expect(subject.possibilities).to eq([1, 2, 3])
      end
    end

    context 'with an array of other segment types' do
      subject { described_class.new(segment: '1-2,2,*/2', minimum: 1, maximum: 5) }

      it 'returns all possibilites for the given segments' do
        expect(subject.possibilities).to eq([1, 2, 3, 5])
      end
    end

    context 'with an array of other segment types in non-ascending order' do
      subject { described_class.new(segment: '5,1,2-3', minimum: 1, maximum: 5) }

      it 'returns all possibilities for the given segments ordered' do
        expect(subject.possibilities).to eq([1, 2, 3, 5])
      end
    end
  end
end
