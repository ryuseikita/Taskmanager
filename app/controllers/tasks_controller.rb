class TasksController < ApplicationController

  def index
    @task = Task.all
  end



end
