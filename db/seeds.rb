# Users
User.create!(email: 'user1@test.com', password: 'foobar', password_confirmation: 'foobar')

# Projects
Project.create!(title: 'Big project', color: 'blue', user_id: 1)
Project.create!(title: 'Side project', color: 'green', user_id: 1)
Project.create!(title: 'My ToDo-List', color: 'brown', user_id: 1)

# Tasks
Task.create!(title: 'Find participants', completed: "true", duedate: '06 Jul 2020', project_id: 1)
Task.create!(title: 'Make a plan', completed: "false", duedate: '10 Jul 2020', project_id: 1)
Task.create!(title: 'Execute plan', completed: "false", duedate: '22 Oct 2020', project_id: 1)
Task.create!(title: 'Update plan', completed: "false", duedate: '01 Dec 2020', project_id: 1)
Task.create!(title: 'Make ToDo-List', completed: "true", duedate: '18 Jan 2020', project_id: 2)
Task.create!(title: 'Set up spreadsheet', completed: "false", duedate: '25 Mar 2020', project_id: 2)
Task.create!(title: 'Invite for meeting', completed: "false", duedate: '16 Aug 2020', project_id: 2)
Task.create!(title: 'Schedule tasks', completed: "false", duedate: '15 Dec 2020', project_id: 3)
