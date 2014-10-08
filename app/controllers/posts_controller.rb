class PostsController < ApplicationController

  before_action :set_post, only: [ :show, :edit, :update, :destroy ]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

    def set_post
      @post = Post.find( params[:id] )
    end

     def user_params
      params.require(:post).permit(:title, :content, :read_time, :status)
    end

end
