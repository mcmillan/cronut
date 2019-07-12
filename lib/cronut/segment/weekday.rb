# frozen_string_literal: true

module Cronut
  module Segment
    class Weekday < Base
      private

      def minimum
        0
      end

      def maximum
        6
      end
    end
  end
end
