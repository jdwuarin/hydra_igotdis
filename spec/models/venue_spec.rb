require 'spec_helper'

describe Venue do

  before do
    @venue = Venue.new(name: "Example Venue")
  end

  subject { @venue }

  it { should respond_to(:name) }

  it { should be_valid }

  describe "when name is not present" do
    before { @venue.name = " " }
    it { should_not be_valid }
  end
end