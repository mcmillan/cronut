require 'spec_helper'

describe Cronut::Segment::Hour do
  let(:invalid_too_low) { '-1' }
  let(:invalid_too_high) { '24' }
  let(:valid) { '12' }

  it_behaves_like 'a segment'
end
