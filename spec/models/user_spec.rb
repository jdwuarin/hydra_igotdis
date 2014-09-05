require 'spec_helper'
require 'spec_shared_context'

describe Venue do

include_context "instance_variables"

  subject { @user }

  it { should respond_to(:name) }

  it { should be_valid }

  describe "when user is deleted, delete all that belongs to it" do
    before { @venue.name = " " }
    it { should_not be_valid }
  end
end