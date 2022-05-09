require 'csv'
class PostsController < ApplicationController

  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = PostService.index
    respond_to do |format|
      format.html
      format.csv {send_data @posts.to_csv}
    end
  end

  def import
    PostService.import(params[:file])
    redirect_to posts_url, notice: "Imported file"
  end

  def new
    @post = PostService.new
  end

  def create
    params[:post][:user_id] = current_user.id
    @post = PostService.create_post(post_params)
    isSave = PostService.save(post_params)
    if isSave
      redirect_to posts_path, notice: "Post was successfully created."
    else
      render :new
    end
    
  end

  def update
    isUpdate = PostService.update(params[:id],post_params)
    if isUpdate
      redirect_to post_path, notice: "Post was successfully updated."
    else
      render :edit
    end
  end

  def destroy
   PostService.destroy(params[:id])
    redirect_to posts_url, notice: "Post was successfully destroyed."
  end

  def show
    
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :description, :status, :user_id)
  end

  def set_post
    @post = PostService.set_post(params[:id])
  end

end