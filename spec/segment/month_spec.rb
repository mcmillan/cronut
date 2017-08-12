require 'spec_helper'

describe Cronut::Segment::Month do
  let(:invalid_too_low) { '0' }
  let(:invalid_too_high) { '13' }
  let(:valid) { '6' }

  it_behaves_like 'a segment'
end
