require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  def setup
    @user = users(:user1)
    @project = @user.projects.build(title: "Lorem ipsum", color: "blue")
  end

  test "should be valid" do
    assert @project.valid?
  end

  test "user id should be present" do
    @project.user_id = nil
    assert_not @project.valid?
  end

  test "title should be present" do
    @project.title = "   "
    assert_not @project.valid?
  end

  test "color should be present" do
    @project.color = "   "
    assert_not @project.valid?
  end

  test "title-user combination must be unique" do
    @project.title = "AAA"
    assert_not @project.valid?
    @user = users(:user2)
    @project.user = @user
    assert @project.valid?
  end

  test "title should be at most 140 characters" do
    @project.title = "a" * 141
    assert_not @project.valid?
  end

  test "order should be alphabetically" do
    assert_equal projects(:first_in_alphabet), Project.first
  end

  test "associated tasks should be destroyed" do
    @project.save
    @project.tasks.create!(title: "Lorem ipsum", completed: true, duedate: "20 Oct 2019")
    assert_difference 'Task.count', -1 do
      @project.destroy
    end
  end
end
