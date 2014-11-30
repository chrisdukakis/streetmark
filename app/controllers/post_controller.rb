class PostController < ApplicationController

  before_action :authenticate_user!

  def index
    if params[:id]
      @post = Post.find(params[:id])
    end
  end

  def create
    if params[:photo]
      loc = [params[:lat], params[:lng]]
      Post.create(
        user_id: current_user._id,
        title: params[:title],
        description: params[:description],
        loc: loc,
        photo: params[:photo],
        voters: [],
        rating: 0
      )
      @posts = Post.where(solved: false).order_by(:rating => 'desc')
      @posted = true
      render 'home/index'
    end
  end

  def edit
  end

  def delete
  end

  def highlight
    if params[:id]
      post = Post.find(params[:id])
      if ! post.voters.include? current_user._id
        post.inc(rating: 1)
        post.voters.push(current_user._id)
        post.save()
      end
      @post = post
      @highlighted = true
      render 'post/index'
    end
  end

  def resolve
  end
end
