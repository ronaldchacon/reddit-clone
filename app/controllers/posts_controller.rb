class PostsController < ApplicationController

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_url
      flash[:notice] = "Successfully created new post"
    else
      redirect_to root_url
      flash[:error] = "Post was not successfully created. Please try again."
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :url)
    end
end
