module Cronut
  class Expression
    attr_reader :expression, :minute, :hour, :day, :month, :weekday, :command

    def initialize(expression)
      @expression = expression
      parse
    end

    def to_s
      <<~HUMANIZED
        minute        #{minute}
        hour          #{hour}
        day of month  #{day}
        month         #{month}
        day of week   #{weekday}
        command       #{command}
      HUMANIZED
    end

    private

    def parse
      segments = expression.strip.split(/\s+/, 6)

      raise ArgumentError, 'Must be 6 segments' unless segments.count == 6

      @minute = Cronut::Segment::Minute.new(segments[0])
      @hour = Cronut::Segment::Hour.new(segments[1])
      @day = Cronut::Segment::Day.new(segments[2])
      @month = Cronut::Segment::Month.new(segments[3])
      @weekday = Cronut::Segment::Weekday.new(segments[4])
      @command = segments[5]
    end
  end
end
