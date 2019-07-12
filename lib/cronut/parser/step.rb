# frozen_string_literal: true

module Cronut
  module Parser
    class Step < Base
      private

      def generate_possibilities
        start, step = segment.split('/', 2)

        start = minimum if start == '*'

        start = safely_convert_to_integer(start)
        step = safely_convert_to_integer(step)

        raise ArgumentError, 'start exceeds maximum' if start > maximum
        raise ArgumentError, 'step exceeds maximum' if step > maximum

        start.upto(maximum).each_slice(step).map(&:first)
      end
    end
  end
end
