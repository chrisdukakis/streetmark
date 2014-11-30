class HomeController < ApplicationController
  def index
    @posts = Post.where(solved: false).order_by(:rating => 'desc')
  end
end