class UsersController < ApplicationController

  def home
  end

  def show
    #This will give instance variables. Page will display user details and also all his posts.
    @user = User.find(params[:id])
    @posts = Post.where("user_id = ?", params[:id])
  end

end
