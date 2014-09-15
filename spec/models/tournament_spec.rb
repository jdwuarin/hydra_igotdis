require 'spec_helper'

describe Tournament do

  before { @tournament = create(:tournament)}

  subject { @tournament }

  it { should respond_to(:name) }
  it { should respond_to(:start_date) }
  it { should respond_to(:end_date) }
  it { should respond_to(:continent_id) }
  it { should respond_to(:tournament_type) }

  it { should be_valid }

  describe "when name is not present" do
    before { @tournament.name = " " }
    it { should_not be_valid }
  end
  describe "when tournament_type is not present" do
    before { @tournament.tournament_type = nil }
    it { should_not be_valid }
  end
  describe "when start_date is not present" do
    before { @tournament.start_date = nil }
    it { should_not be_valid }
  end
  describe "should start before it ends" do
    before do
      date_before_tournament = @tournament.start_date - 1
      @tournament.end_date = date_before_tournament 
    end
    it { should_not be_valid }
  end
end