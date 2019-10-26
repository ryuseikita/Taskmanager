class Admin::UsersController < ApplicationController
  before_action :admin_check
  before_action :set_user, only:[:edit,:update,:show,:destroy]
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    #未修正
  end

  def show
  end

  def destroy
    if anotheradmin_check
      @user.delete
      redirect_to admin_users_path,notice: "ユーザを削除しました"
    elsif
      redirect_to admin_users_path,notice: "ERROR:管理者ユーザが存在しなくなるため、削除できません"
    end
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

  def anotheradmin_check
    if User.admin_count == 1 and @user.admin
      return false
    else
      return true
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,:admin)
  end
end
