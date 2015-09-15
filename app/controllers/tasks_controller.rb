class TasksController < InheritedResources::Base

  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks
  end

  def create
    create!{ tasks_path }
  end

  protected

  def begin_of_association_chain
    current_user
  end

end
