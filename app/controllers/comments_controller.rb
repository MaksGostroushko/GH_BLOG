class CommentsController < ApplicationController
  before_action :logged_in_user
  before_action :find_micropost

  # merge - returns an array representing the intersection of the resulting
  # records with other
  def create
    @comment = @micropost.comments.create(comment_params.merge(user: current_user))
    redirect_to @micropost
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
    params.require(:comment).permit(:body)
  end
end
