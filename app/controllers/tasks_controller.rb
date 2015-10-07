class TasksController < InheritedResources::Base

  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks
  end

  def create
    create!{ tasks_path }
  end

  def share
    @task = load_model
    @task.posts.create!(user_id: current_user.id)
    redirect_to controller: :posts, action: :index
  end

  protected

  def begin_of_association_chain
    current_user
  end

  def load_model
    @task = current_user.tasks.find(params[:id])
  end

end
