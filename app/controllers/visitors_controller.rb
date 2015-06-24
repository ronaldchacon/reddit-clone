class VisitorsController < ApplicationController
  def new
    if user_signed_in?
      @post = current_user.posts.build
    end
  end
end
