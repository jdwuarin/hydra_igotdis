require 'spec_helper'
require 'spec_shared_context'

describe Tournament do

include_context "instance_variables"

  subject { @tournament }

  it { should respond_to(:name) }
  it { should respond_to(:game_id) }
  it { should respond_to(:start_date) }
  it { should respond_to(:end_date) }
  it { should respond_to(:venue) }
  it { should respond_to(:continent_id) }

  it { should be_valid }

  describe "when name is not present" do
    before { @tournament.name = " " }
    it { should_not be_valid }
  end
  describe "when game_id is not present" do
    before { @tournament.game_id = nil }
    it { should_not be_valid }
  end
  describe "when venue is not present" do
    before { @tournament.venue = nil }
    it { should_not be_valid }
  end
  describe "when start_date is not present" do
    before { @tournament.start_date = nil }
    it { should_not be_valid }
  end
  describe "should start before it ends" do
    date_before_tournament = @tournament.start_date - 1
    before { @tournament.end_date = date_before_tournament }
    it { should_not be_valid }
  end
end