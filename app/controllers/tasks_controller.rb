class TasksController < InheritedResources::Base

  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks
  end

  def create
    byebug
    @task = Task.new params[:task]
    @task.save
  end

end
