# frozen_string_literal: true

require 'spec_helper'

describe Cronut::Parser do
  describe '.for' do
    context 'with a segment of *' do
      subject { described_class.for(segment: '*', minimum: 0, maximum: 60) }

      it 'returns an instance of Cronut::Parser::Any' do
        expect(subject).to be_an_instance_of(Cronut::Parser::Any)
      end
    end

    context 'with a segment of 1,2,3' do
      subject { described_class.for(segment: '1,2,3', minimum: 0, maximum: 60) }

      it 'returns an instance of Cronut::Parser::List' do
        expect(subject).to be_an_instance_of(Cronut::Parser::List)
      end
    end

    context 'with a segment of 1-2' do
      subject { described_class.for(segment: '1-2', minimum: 0, maximum: 60) }

      it 'returns an instance of Cronut::Parser::Range' do
        expect(subject).to be_an_instance_of(Cronut::Parser::Range)
      end
    end

    context 'with a segment of */5' do
      subject { described_class.for(segment: '*/5', minimum: 0, maximum: 60) }

      it 'returns an instance of Cronut::Parser::Step' do
        expect(subject).to be_an_instance_of(Cronut::Parser::Step)
      end
    end

    context 'with a segment of 1' do
      subject { described_class.for(segment: '1', minimum: 0, maximum: 60) }

      it 'returns an instance of Cronut::Parser::Exact' do
        expect(subject).to be_an_instance_of(Cronut::Parser::Exact)
      end
    end

    context 'with an invalid segment' do
      it 'raises an ArgumentError' do
        expect do
          described_class.for(segment: 'bananas', minimum: 0, maximum: 60)
        end.to raise_error(ArgumentError)
      end
    end
  end
end
