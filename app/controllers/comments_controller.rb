class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html {
          redirect_to post_path(@post)
          flash[:notice] = "Comment was saved"
        }
        format.js
      else
        format.html {
          redirect_to post_path(@post)
          flash[:error] = "Comment was not saved. Please try again."
        }
        format.js
      end
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:post_id, :user_id, :body)
    end
end
