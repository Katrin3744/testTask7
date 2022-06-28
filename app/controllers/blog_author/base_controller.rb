class BlogAuthor::BaseController < ApplicationController
  layout 'blog_author'

  before_action :authenticate_user!
  before_action :blog_author_required!

  private

  def blog_author_required!
    redirect_to root_path, alert: 'You are not authorised to view this page,' unless current_user.is_a?(BlogAuthor)
  end
end