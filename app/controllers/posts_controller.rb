class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    # index will be a list of posts
    @posts = current_user.posts.all.order("id DESC")
  end

  def show
    @post = current_user.posts.find(params[:id])
  end

  def new
    # form to add post
    @post = current_user.posts.build
  end

  def create
    # check if submitted to create: render plain: params[:post].inspect
    @post = current_user.posts.build(post_params)
    if (@post.save)
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if (@post.update(post_params))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private def post_params
    params.require(:post).permit(:title, :body)
  end

end
