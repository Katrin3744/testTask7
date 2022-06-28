class BlogAuthor::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(posts_params)
    if @post.save
      redirect_to blog_author_posts_path
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to blog_author_posts_path
  end

  private

  def posts_params
    params.require(:post).permit(:title, :body)
  end
end
