# frozen_string_literal: true

module Cronut
  module Parser
    def self.for(segment:, maximum:, minimum:)
      case segment
      when '*'
        klass = Cronut::Parser::Any
      when /,/
        klass = Cronut::Parser::List
      when /[0-9]+-[0-9]+/
        klass = Cronut::Parser::Range
      when /\//
        klass = Cronut::Parser::Step
      when /^[0-9]+$/
        klass = Cronut::Parser::Exact
      else
        raise ArgumentError, "Invalid segment: #{segment}"
      end

      klass.new(segment: segment, maximum: maximum, minimum: minimum)
    end
  end
end
