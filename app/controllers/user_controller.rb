class UserController < ApplicationController
  def index
    if params[:id]
      @user = User.find(params[:id])
    end
  end
end
