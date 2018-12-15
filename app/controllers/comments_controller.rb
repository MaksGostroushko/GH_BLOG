class CommentsController < ApplicationController
  before_action :logged_in_user
  before_action :find_micropost

  def new
    @micropost = Micropost.find(params[:micropost_id])
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def create
    @comment = @micropost.comments.create(comment_params.merge(user: current_user))
    if @comment.save
      redirect_to @micropost
    else
      redirect_to @micropost
      flash[:danger] = "Comment is too long (maximum is 150 characters)"
    end
 end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def find_micropost
    @micropost = Micropost.find(params[:micropost_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :parent_id)
  end
end
