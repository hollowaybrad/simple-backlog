require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

   test "project attributes must not be empty" do
    project = Project.new
    assert project.invalid?
    assert project.errors[:name].any?
    assert project.errors[:name].any?
  end

end
