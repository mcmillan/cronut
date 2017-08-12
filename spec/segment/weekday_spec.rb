require 'spec_helper'

describe Cronut::Segment::Weekday do
  let(:invalid_too_low) { '-1' }
  let(:invalid_too_high) { '7' }
  let(:valid) { '3' }

  it_behaves_like 'a segment'
end
