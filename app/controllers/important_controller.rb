class ImportantController < ApplicationController
  def index
    if user_signed_in? 
      @posts = Post.where(:voters => current_user._id, solved: false)
    else
      @posts = Post.where(solved: false).order_by(:rating => 'desc')
    end
  end
end
