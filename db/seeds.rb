# Users
User.create!(email: 'user1@test.com', password: 'foobar', password_confirmation: 'foobar')
User.create!(email: 'user2@test.com', password: 'foobar', password_confirmation: 'foobar')

# Projects
Project.create!(title: 'Big project', color: 'red', user_id: 1)
Project.create!(title: 'Side project', color: 'green', user_id: 1)
Project.create!(title: 'My ToDo-List', color: 'green', user_id: 2)

# Tasks
Task.create!(title: 'Find participants', completed: "true", duedate: '06 Oct 2019', project_id: 1)
Task.create!(title: 'Make a plan', completed: "false", duedate: '07 Oct 2019', project_id: 1)
Task.create!(title: 'Execute plan', completed: "true", duedate: '14 Oct 2019', project_id: 1)
Task.create!(title: 'Update plan', completed: "false", duedate: '13 Oct 2019', project_id: 1)
Task.create!(title: 'Make ToDo-List', completed: "true", duedate: '15 Oct 2019', project_id: 2)
Task.create!(title: 'Set up spreadsheet', completed: "false", duedate: '15 Oct 2019', project_id: 2)
Task.create!(title: 'Invite for meeting', completed: "false", duedate: '16 Oct 2019', project_id: 2)
Task.create!(title: 'Schedule tasks', completed: "false", duedate: '25 Jan 2020', project_id: 3)
