require 'spec_helper'
require 'spec_shared_context'

describe Venue do

include_context "instance_variables"

  subject { @venue }

  it { should respond_to(:name) }

  it { should be_valid }

  describe "when name is not present" do
    before { @venue.name = " " }
    it { should_not be_valid }
  end

  describe "when name is not unique" do

    it {should_not be_valid}
  end
end