require "spec_helper"

RSpec.describe Solamente::Heading do
  it "cycles todo state" do
    heading = described_class.new("* Example heading")
    cycled_heading = heading.cycle_todo_state(["TODO"])
    expect(cycled_heading).to eq("* TODO Example heading")
  end
end
