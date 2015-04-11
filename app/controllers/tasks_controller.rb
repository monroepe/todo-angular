class TasksController < ApplicationController
  before_action :authenticate_user!

  def new
    @task = task.new
  end

  def create
    @task_list = Task_List.find(params[:task_list_id])
    @task = current_user.tasks.build(task_params)
    @task.task_list = @task_list

    if @task.save
      redirect_to @task_list, notice: "Task List created successfully!"
    else
      render "new"
    end
  end

  def edit
    @task = task.find(params[:id])
  end

  def update
    @task_list = Task_List.find(params[:task_list_id])
    @task = task.find(params[:id])

    if @task.update(task_params)
      redirect_to @task_list, notice: "Task List updated successfully!"
    else
      render "edit"
    end
  end

  def destroy
    @task_list = Task_List.find(params[:task_list_id])
    @task = task.find(params[:id])

    @task.destroy

    redirect_to @task_list, notice: "Task List deleted successfully!"
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end

end
