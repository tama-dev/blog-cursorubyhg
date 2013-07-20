class CommentsController < ApplicationController
  respond_to :html, :json, :xml
  before_filter :load_post

  # GET /posts/:id/edit
  def edit
  end

  # POST /posts
  def create
    @comment = @post.comments.build(params[:comment])

    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to @post
    else
      flash[:error] = 'Comment was not created.'
      redirect_to @post
    end
  end

  # PUT /posts/:id
  def update
    if @comment.update_attributes(params[:comment])
      flash[:notice] = 'Comment was successfully created.'
      respond_with @comment
    else
      render :edit
    end
  end

  # DELETE /posts/:id
  def destroy
    @comment.destroy
    respond_with @comment
  end

  private

  def load_post
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id]) if params[:id]
  end

end
