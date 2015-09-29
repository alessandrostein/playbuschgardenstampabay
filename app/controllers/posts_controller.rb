class PostsController < InheritedResources::Base

  before_action :authenticate_user!

  def index
    @post = current_user.posts.new
  end

  def create
    create!{ posts_path }
  end

  protected

  def begin_of_association_chain
    current_user
  end

end
