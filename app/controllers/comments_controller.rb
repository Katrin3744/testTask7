class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.find(params[:post_id])
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post = Post.find(params[:post_id])
    if @comment.save
      redirect_to post_comments_path(@comment.post)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit( :body)
  end
end
