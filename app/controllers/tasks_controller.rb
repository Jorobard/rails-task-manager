class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @new_task = Task.new # Needed to instantiate the form_with
  end

  def create
    @create_task = Task.new(params[:task])
    @create_task.save # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to task_path(@task)
  end

  def edit
    @edit_task = Task.find(params[:id])
  end

  def update
    @update_task = Task.find(params[:id])
    @update_task.update(params[:task]) # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to task_path(@restaurant)
  end

  def destroy
    @destroy_task = Task.find(params[:id])
    @destroy_task.destroy
    redirect_to task_path, status: :see_other
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
