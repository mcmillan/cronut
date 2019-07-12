# frozen_string_literal: true

module Cronut
  module Parser
    class List < Base
      private

      def generate_possibilities
        segments = segment.split(',')

        ranges = segments.map do |segment|
          Cronut::Parser.for(segment: segment, maximum: maximum, minimum: minimum)
        end

        ranges.flat_map(&:possibilities).uniq.sort
      end
    end
  end
end
