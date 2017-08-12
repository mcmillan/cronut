module Cronut
  module Parser
    class Any < Base
      private

      def generate_possibilities
        (minimum..maximum).to_a
      end
    end
  end
end
