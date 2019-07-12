# frozen_string_literal: true

require 'spec_helper'

describe Cronut::Expression do
  subject { described_class.new('*/15 0 1,15 * 1-5 /usr/bin/find') }

  describe '#initialize' do
    context 'given an expression with less than 6 segments' do
      it 'raises an ArgumentError' do
        expect { described_class.new('* * * * /usr/bin/yes') }.to raise_error(ArgumentError)
      end
    end

    context 'given an invalid expression' do
      it 'raises an ArgumentError' do
        expect { described_class.new('* * * * cheese /usr/bin/yes') }.to raise_error(ArgumentError)
      end
    end

    context 'given a valid expression' do
      it 'does not raise an error' do
        expect { described_class.new('* * * * * /usr/bin/yes') }.to_not raise_error
      end
    end

    context 'given a valid expression with extraneous whitespace' do
      it 'does not raise an error' do
        expect { described_class.new(' *   * * *  * /usr/bin/yes') }.to_not raise_error
      end
    end
  end

  describe '#to_s' do
    it 'returns results in a human-readable format' do
      expect(subject.to_s).to eq <<~HUMANIZED
        minute        0 15 30 45
        hour          0
        day of month  1 15
        month         1 2 3 4 5 6 7 8 9 10 11 12
        day of week   1 2 3 4 5
        command       /usr/bin/find
      HUMANIZED
    end
  end
end
