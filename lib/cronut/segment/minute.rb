# frozen_string_literal: true

module Cronut
  module Segment
    class Minute < Base
      private

      def minimum
        0
      end

      def maximum
        59
      end
    end
  end
end
