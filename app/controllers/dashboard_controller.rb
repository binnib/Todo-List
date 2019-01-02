class DashboardController < ApplicationController
  authorize_resource class: false

  def index
    @developer_wise_todos = Todo.includes(:developer).all.group_by { |todo| todo.developer }
    @project_wise_todos = Todo.includes(:project).all.group_by { |todo| todo.project }
    # Data for todo chart: status wise distribution
    @status_wise_todos = Todo.group(:status).count.map {|k, v| [ k.titleize, v] }.to_h
    @status_wise_todos = @status_wise_todos.to_a.unshift(["Status", "Count"])
  end
end
