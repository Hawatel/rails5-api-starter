class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /todos
  # GET /todos.json
  def index
    @todos = Todo.all
    render json:todos
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
    if Todo.cache_find(params[:id])
      @todos = Todo.cache_find(params[:id])
    end
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render :show, status: :created, location: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    if @todo.update(todo_params)
      render :show, status: :ok, location: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end


  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      if Todo.cache_find(params[:id])
        @todo = Todo.cache_find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:title, :completed, :order)
    end

end
