require 'spec_helper'

describe Venue do

  before {@venue = create(:venue)}

  subject {@venue}

  it { should respond_to(:name) }

  it { should be_valid }

  describe "when name is not present" do
    before { @venue.name = " " }
    it { should_not be_valid }
  end

  describe "when name is not unique" do
    before do
      @same_name_venue = build(:venue, name: @venue.name)
    end
    subject {@same_name_venue}
    it { should_not be_valid }
  end

end