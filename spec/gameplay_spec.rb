# spec/gameplay_spec.rb

require "./lib/gameplay.rb"

include Gameplay

describe Gameplay do
  describe "#get_input" do
    it "returns the column that the player selected" do
      allow(Gameplay).to receive(:gets).and_return("5")
      expect(Gameplay.get_user_input).to eql("5")
    end

    it "returns the column that the player selected after erroneous entry" do
      allow(Gameplay).to receive(:gets).and_return("invalid input", "60", "-1", "2")
      expect(Gameplay.get_user_input).to eql("2")
    end
  end
end