module Cronut
  module Parser
    class List < Base
      private

      def generate_possibilities
        segment.split(',').map do |n|
          safely_convert_to_integer(n)
        end
      end
    end
  end
end
