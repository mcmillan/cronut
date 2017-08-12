module Cronut
  module Segment
    class Month < Base
      private

      def minimum
        1
      end

      def maximum
        12
      end
    end
  end
end
