class Admin::UsersController < ApplicationController
  before_action :admin_check
  before_action :set_user, only:[:edit,:update,:show,:destroy]
  def index
    @user = User.all
  end

  def edit
  end

  def update
    #未修正
  end

  def show
  end

  def destroy
    @user.delete
    redirect_to admin_users_path,notice: "ユーザを削除しました"
  end


  private
  
  def admin_check
    if logged_in?
      unless current_user.admin
        redirect_to tasks_path ,notice: "管理者権限を持ったユーザでログインをしてください。"
      end
    elsif
      redirect_to tasks_path ,notice: "ログインをしてください。"
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end
