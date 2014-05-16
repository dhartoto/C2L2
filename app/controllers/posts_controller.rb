class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update]
  before_action :set_cat

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = User.first # TODO: This will need to be changed when we add authentication!
    if @post.save
      flash[:notice] = "Your post was created."
      redirect_to posts_path
    else
      render :new  
    end
  end

  def edit; end

  def update
    if @post.update(post_params) # Why is this not @post.update = post_params
      flash[:notice] = "You post has been updated!"
      redirect_to post_path(@post)
    else
        render :edit
    end
  end

private
  def post_params
    params.require(:post).permit!
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_cat
    @categories = Category.all
  end
end
