# Create manager
manager = User.create!(name: 'Manager', email: 'manager@todo.com', password: 'todotask', password_confirmation: 'todotask', role: :manager)

# Create developers
developer1 = User.create!(name: 'Developer A', email: 'developera@todo.com', password: 'todotask', password_confirmation: 'todotask', role: :developer)
developer2 = User.create!(name: 'Developer B', email: 'developerb@todo.com', password: 'todotask', password_confirmation: 'todotask', role: :developer)
developer3 = User.create!(name: 'Developer C', email: 'developerc@todo.com', password: 'todotask', password_confirmation: 'todotask', role: :developer)

# Create projects
project1 = Project.create!(name: 'Project P1')
project2 = Project.create!(name: 'Project P2')

[project1, project2].each do |project|
  # Create todos - developer1
  ['todo a1', 'todo a2', 'todo a3'].each do |value|
    value = "#{value} - #{project.name}"
    Todo.create!(title: value, description: value, project_id: project.id, user_id: developer1.id, status: :done)
  end
  Todo.create!(title: "todo a4 - #{project.name}", description: "#todo a4 - #{project.name}", project_id: project.id, user_id: developer1.id, status: :in_progress)
  ['todo a5', 'todo a6', 'todo a7'].each do |value|
    value = "#{value} - #{project.name}"
    Todo.create!(title: value, description: value, project_id: project.id, user_id: developer1.id, status: :new)
  end

  # Create todos - developer2
  ['todo b1', 'todo b2'].each do |value|
    value = "#{value} - #{project.name}"
    Todo.create!(title: value, description: value, project_id: project.id, user_id: developer2.id, status: :done)
  end
  Todo.create!(title: "todo b3 - #{project.name}", description: "#todo b3 - #{project.name}", project_id: project.id, user_id: developer2.id, status: :in_progress)
  ['todo b4', 'todo b5'].each do |value|
    value = "#{value} - #{project.name}"
    Todo.create!(title: value, description: value, project_id: project.id, user_id: developer2.id, status: :new)
  end

  # Create todos - developer3
  ['todo c1', 'todo c2', 'todo c3'].each do |value|
    Todo.create!(title: value, description: value, project_id: project.id, user_id: developer3.id, status: :done)
  end

  Todo.create!(title: "todo c4 - #{project.name}", description: "#todo c4 - #{project.name}", project_id: project.id, user_id: developer1.id, status: :in_progress)
  ['todo c5', 'todo c6'].each do |value|
    Todo.create!(title: value, description: value, project_id: project.id, user_id: developer3.id, status: :new)
  end
end
