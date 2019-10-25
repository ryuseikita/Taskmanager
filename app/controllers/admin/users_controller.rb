class Admin::UsersController < ApplicationController
  def index
    @user = User.all
  end
end
