# frozen_string_literal: true

require 'spec_helper'

describe Cronut::Segment::Minute do
  let(:invalid_too_low) { '-1' }
  let(:invalid_too_high) { '60' }
  let(:valid) { '30' }

  it_behaves_like 'a segment'
end
