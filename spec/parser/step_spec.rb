require 'spec_helper'

describe Cronut::Parser::Step do
  describe '#initialize' do
    context 'with a start that is not an integer or *' do
      it 'raises an ArgumentError' do
        expect { described_class.new(segment: 'cheese/1', minimum: 1, maximum: 2) }.to raise_error(ArgumentError)
      end
    end

    context 'with a non-integer step' do
      it 'raises an ArgumentError' do
        expect { described_class.new(segment: '1/cheese', minimum: 1, maximum: 2) }.to raise_error(ArgumentError)
      end
    end

    context 'with a start outside of minimum and maximum' do
      it 'raises an ArgumentError' do
        expect { described_class.new(segment: '100/1', minimum: 1, maximum: 2) }.to raise_error(ArgumentError)
      end
    end

    context 'with a step outside of minimum and maximum' do
      it 'raises an ArgumentError' do
        expect { described_class.new(segment: '1/100', minimum: 1, maximum: 2) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#possibilities' do
    context 'with an integer start value' do
      subject { described_class.new(segment: '1/2', minimum: 0, maximum: 6) }

      it 'returns from the supplied start to the maximum value in increments of the supplied step' do
        expect(subject.possibilities).to eq([1, 3, 5])
      end
    end

    context 'with a start value of *' do
      subject { described_class.new(segment: '*/3', minimum: 1, maximum: 10) }

      it 'sets the start to the supplied minimum' do
        expect(subject.possibilities).to eq([1, 4, 7, 10])
      end
    end
  end
end
