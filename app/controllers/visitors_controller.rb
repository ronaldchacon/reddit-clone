class VisitorsController < ApplicationController
  def new
    @post = current_user.posts.build if user_signed_in?
    @posts = Post.paginate(page: params[:page])
  end
end
