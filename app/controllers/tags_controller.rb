class TagsController < ApplicationController

  def index
    @posts = Post.where("solved=?",false).reverse_order
  end

  def show
    @tag = Tag.find(params[:id])
    @posts = Tag.includes(:posts).find(@tag.id).posts.where("solved=?", false)
  end

end
