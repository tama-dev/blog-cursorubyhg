class PostsController < ApplicationController
  respond_to :html, :json, :xml
  before_filter :load_post

  # GET /posts
  def index
    @posts = Post.all
    respond_with @posts
  end

  # GET /posts/:id
  def show
    @post.comments.build
    respond_with @post
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/:id/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(params[:post])

    if @post.save
      flash[:notice] = 'Post was successfully created.'
      respond_with @post
    else
      render :new
    end
  end

  # PUT /posts/:id
  def update
    if @post.update_attributes(params[:post])
      flash[:notice] = 'Post was successfully created.'
      respond_with @post
    else
      render :edit
    end
  end

  # DELETE /posts/:id
  def destroy
    @post.destroy
    respond_with @post
  end

  private

  def load_post
    @post = Post.find(params[:id]) if params[:id].present?
  end
end
