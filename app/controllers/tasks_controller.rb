class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    task = Task.new(task_params)
    if task.save
      redirect_to task_path(task.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.Find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
