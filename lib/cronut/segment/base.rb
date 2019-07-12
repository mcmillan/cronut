# frozen_string_literal: true

module Cronut
  module Segment
    class Base
      attr_reader :possibilities

      def initialize(segment)
        parser = Cronut::Parser.for(
          segment: segment,
          minimum: minimum,
          maximum: maximum
        )
        @possibilities = parser.possibilities
      end

      def to_s
        possibilities.join(' ')
      end

      private

      def minimum
        raise NotImplementedError
      end

      def maximum
        raise NotImplementedError
      end
    end
  end
end
