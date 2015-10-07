class PostsController < InheritedResources::Base

  before_action :authenticate_user!

  def index
    @post = current_user.posts.new
  end

  def create
    create!{ posts_path }
  end

  def like
    @post = load_model
    current_user.likes.create!(post_id: @post.id)
    render :index
  end

  def unlike
    @like = load_like
    @like.destroy
    render :index
  end

  protected

  def begin_of_association_chain
    current_user
  end

  def load_model
    @post = Post.find(params[:id])
  end

  def load_like
    @like = current_user.likes.where(post_id: params[:id]).last
  end

end
