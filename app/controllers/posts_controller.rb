class PostsController < InheritedResources::Base

  before_action :authenticate_user!

  before_action :set_menu_context, if: ->() { user_signed_in? }

  def set_menu_context
    @menu_context = actual_menu_context
  end

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

  private

  def actual_menu_context
    :timeline
  end

end
