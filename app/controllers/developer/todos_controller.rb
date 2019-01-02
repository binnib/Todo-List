class Developer::TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update]

  # GET /todos
  # GET /todos.json
  def index
    @todos = current_user.todos
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
  end

  # GET /todos/1/edit
  def edit
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  private


  # Use callbacks to share common setup or constraints between actions.
  def set_todo
    @todo = current_user.todos.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def todo_params
    params.fetch(:todo, {}).permit(:user_id, :title, :description, :status)
  end
end
