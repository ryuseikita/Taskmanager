class TasksController < ApplicationController

  def index
    @task = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    binding.pry
    if @task.save
     redirect_to tasks_path, notice: "タスクを作成しました"
    else
     render 'new'
    end
  end

  private

  def task_params
    params.require(:task).permit(:title,:details,:deadline,:priority,:status)
  end

end
