module Cronut
  module Parser
    class Base
      attr_reader :segment, :minimum, :maximum, :possibilities

      def initialize(segment:, minimum:, maximum:)
        @segment = segment
        @minimum = minimum
        @maximum = maximum

        @possibilities = generate_possibilities
        validate_possibilities!
      end

      private

      def generate_possibilities
        raise NotImplementedError
      end

      def validate_possibilities!
        @possibilities.each do |possibility|
          next if (minimum..maximum).cover?(possibility)

          raise ArgumentError, 'Possibilities exceed permitted range'
        end
      end

      def safely_convert_to_integer(number)
        Integer(number)
      rescue ArgumentError
        raise ArgumentError, "Non-numeric value supplied: #{number}"
      end
    end
  end
end
