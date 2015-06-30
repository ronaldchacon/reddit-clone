class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

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

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build
    @comments = @post.comments.paginate(page: params[:page])
  end

  private
    def post_params
      params.require(:post).permit(:title, :url)
    end
end
