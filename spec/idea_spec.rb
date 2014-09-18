require "spec_helper"
require "idea"

describe idea do
  it "has a title"
    idea = Idea.new
    idea.title.should be_true
  end
end