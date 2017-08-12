module Cronut
  module Parser
    class Exact < Base
      private

      def generate_possibilities
        @possibilities = [safely_convert_to_integer(segment)]
      end
    end
  end
end
