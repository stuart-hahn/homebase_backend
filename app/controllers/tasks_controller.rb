class TasksController < ApplicationController
  # GET /tasks
  # This action fetches and returns all tasks from the database.
  def index
    @tasks = Task.all
    render json: @tasks
  end

  # GET /tasks/:id
  # This action fetches a single task by its ID.
  def show
    @task = Task.find(params[:id])
    render json: @task
  end

  # POST /tasks
  # This action creates a new task in the database.
  def create
    @task = Task.new(task_params)
    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/:id
  # This action updates an existing task by its ID.
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/:id
  # This action deletes a task by its ID.
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    head :no_content
  end

  private

  # Strong parameters to permit title, status, priority, and due_date for task creation/updating
  def task_params
    params.require(:task).permit(:title, :status, :due_date, :priority)
  end
end
