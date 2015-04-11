class TaskListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @task_lists = task_list.order(:name)
  end

  def show
    @task_list = task_list.find(params[:id])
    @tasks = @task_list.tasks
  end

  def new
    @task_list = task_list.new
  end

  def create
    @task_list = current_user.task_lists.build(task_list_params)

    if @task_list.save
      redirect_to @task_list, notice: "Task List created successfully!"
    else
      render "new"
    end
  end

  def edit
    @task_list = task_list.find(params[:id])
  end

  def update
    @task_list = task_list.find(params[:id])

    if @task_list.update(task_list_params)
      redirect_to @task_list, notice: "Task List updated successfully!"
    else
      render "edit"
    end
  end

  def destroy
    @task_list = task_list.find(params[:id])

    @task_list.destroy

    redirect_to task_lists_path, notice: "Task List deleted successfully!"
  end

  private

  def task_list_params
    params.require(:task_list).permit(:name)
  end

end
