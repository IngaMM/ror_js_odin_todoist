require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  def setup
    @project = projects(:another_project)
    @task = @project.tasks.build(title: "Lorem ipsum", completed: true, duedate: "20 Oct 2021")
  end

  test "should be valid" do
    assert @task.valid?
  end

  test "project id should be present" do
    @task.project_id = nil
    assert_not @task.valid?
  end

  test "title should be present" do
    @task.title = "   "
    assert_not @task.valid?
  end

  test "duedate should be present" do
    @task.duedate = "   "
    assert_not @task.valid?
  end

  test "completed should be present" do
    @task.completed = nil
    assert_not @task.valid?
  end

  test "title should be at most 140 characters" do
    @task.title = "a" * 141
    assert_not @task.valid?
  end

  test "order should be according to date" do
    assert_equal tasks(:another_task), Task.first
  end

end
