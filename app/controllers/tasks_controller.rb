class TasksController < ApplicationController
  before_action :set_task, only:[:edit,:update,:show,:destroy]

  def index
    unless logged_in?
      redirect_to new_session_path
    else
      @tasks = Task.where(user_id: current_user.id).list(params).page(params[:page]).per(5)
    end
  end

  def new
    @task = Task.new(deadline: Time.now.strftime("%Y/%m/%d 00:00"))
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
     redirect_to tasks_path, notice: "タスクを作成しました"
    else
     render 'new'
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
     redirect_to tasks_path, notice: "タスクを更新しました！"
    else
     render 'edit'
    end
  end

  def show
  end

  def destroy
    @task.delete
    redirect_to tasks_path, notice: "タスクを削除しました！"
  end

  private

  def task_params
    params.require(:task).permit(:title,:details,:deadline,:priority,:status)

  end

  def set_task
    @task = Task.find(params[:id])
  end


end
