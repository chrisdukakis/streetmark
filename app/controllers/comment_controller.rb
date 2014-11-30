class CommentController < ApplicationController
  before_action :authenticate_user!
  def create
    post = Post.find(params[:id])
    if ( post )
      post.comments.create(
        user_id: current_user._id,
        text: params[:text]
      )
      @post = Post.find(params[:id])
      @comment_posted = true
      render 'post/index'
    end
  end

  def delete
  end
end
