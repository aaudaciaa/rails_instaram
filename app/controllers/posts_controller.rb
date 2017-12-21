class PostsController < ApplicationController
  before_action :authenticate_user

  def index
    @posts = Post.all.reverse
  end

  def new
  end

  def create
    Post.create(
      title: params[:title],
      content: params[:content],
      user_id: current_user.id,
      avatar: params[:avatar]
    )
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(
      title: params[:title],
      content: params[:content]
    )
    redirect_to "/posts/show/#{params[:id]}"
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to '/'
  end
end
