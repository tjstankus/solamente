require "spec_helper"

RSpec.describe Solamente::Heading do
  describe "#cycle_todo_keyword" do
    it "cycles todo keyword from empty" do
      heading = described_class.new("* Example heading", ["TODO"])
      cycled_heading = heading.cycle_todo_keyword
      expect(cycled_heading).to eq("* TODO Example heading")
    end

    it "cycles to next keyword" do
      heading = described_class.new("* TODO Example heading", ["TODO", "WIP"])
      cycled_heading = heading.cycle_todo_keyword
      expect(cycled_heading).to eq("* WIP Example heading")
    end

    it "cycles to empty from last keyword" do
      heading = described_class.new("* DONE Example heading", ["TODO", "DONE"])
      cycled_heading = heading.cycle_todo_keyword
      expect(cycled_heading).to eq("* Example heading")
    end
  end
end
