class CommentsController < ApplicationController
  def index
    @comments = Comment.hash_tree
  end

  def new
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def create
    if params[:comment][:parent_id].to_i > 0
      parent = Comment.find_by_id(params[:comment].delete(:parent_id))
      @comment = parent.children.build(params[:comment])
    else
      @comment = Comment.new(params[:comment])
    end

    classify = Classifier::Bayesian.new(@comment.text)
    @comment.classifier = classify.is_good? ? :good : :bad

    if @comment.save
      render json: { sucess: true }
    else
      render json: { sucess: false }
    end
  end

end
