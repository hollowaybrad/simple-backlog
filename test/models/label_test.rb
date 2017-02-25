require 'test_helper'

class LabelTest < ActiveSupport::TestCase

  test "label attributes must not be empty" do
    label = Label.new
    assert label.invalid?
    assert label.errors[:title].any?
  end
  
end
