# This is meant for manager to manage todos resource
class TodosController < ApplicationController
  before_action :set_project
  before_action :load_developers, only: [:new, :edit, :update, :create]
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  # GET /todos
  # GET /todos.json
  def index
    @todos = @project.todos
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = @project.todos.build
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = @project.todos.build(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to project_todo_path(@project, @todo), notice: 'Todo was successfully created.' }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to project_todo_path(@project, @todo), notice: 'Todo was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to project_todos_url, notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = @project.todos.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def load_developers
      @developers = User.developer
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.fetch(:todo, {}).permit(:user_id, :project_id, :title, :description)
    end
end
