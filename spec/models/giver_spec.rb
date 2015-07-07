require 'spec_helper'

describe Giver do
  it { should validate_presence_of(:full_name) }
  it { should validate_presence_of(:message) }
end
