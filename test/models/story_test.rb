require 'test_helper'

class StoryTest < ActiveSupport::TestCase

 test "story attributes must not be empty" do
    story = Story.new
    assert story.invalid?
    assert story.errors[:title].any?
    assert story.errors[:project].any?
  end

end
