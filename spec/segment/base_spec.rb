require 'spec_helper'

shared_examples_for 'a segment' do
  describe '#initialize' do
    context 'with a value less than the minimum' do
      it 'raises an ArgumentError' do
        expect { described_class.new(invalid_too_low) }.to raise_error(ArgumentError)
      end
    end

    context 'with a value greater than the maximum' do
      it 'raises an ArgumentError' do
        expect { described_class.new(invalid_too_high) }.to raise_error(ArgumentError)
      end
    end

    context 'with a value between the minimum and maximum' do
      it 'does not raise an error' do
        expect { described_class.new(valid) }.to_not raise_error
      end
    end
  end
end
