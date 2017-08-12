require 'spec_helper'

describe Cronut::Segment::Day do
  let(:invalid_too_low) { '0' }
  let(:invalid_too_high) { '32' }
  let(:valid) { '10' }

  it_behaves_like 'a segment'
end
