class TasksController < InheritedResources::Base

  before_action :authenticate_user!

  before_action :set_menu_context, if: ->() { user_signed_in? }

  def set_menu_context
    @menu_context = actual_menu_context
  end

  def index
    @tasks = Task.where("expires_on > ?", Date.today)
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

  private

  def actual_menu_context
    :tasks
  end

end
