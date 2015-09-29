class PostsController < InheritedResources::Base

  before_action :authenticate_user!

  def index
  end

end
