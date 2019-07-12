# frozen_string_literal: true

module Cronut
  module Parser
    class Range < Base
      private

      def generate_possibilities
        from, to = segment.split('-', 2).map do |n|
          safely_convert_to_integer(n)
        end

        (from..to).to_a
      end
    end
  end
end
