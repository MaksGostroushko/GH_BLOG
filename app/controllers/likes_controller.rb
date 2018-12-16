class LikesController < ApplicationController

  def create
    # if params[:comment_id].present?
    #   @comment = Comment.find(params[:comment_id])
    #   @comment_like = @comment.likes.create!(user: current_user)
    # else
      @micropost = Micropost.find(params[:micropost_id])
      @like = @micropost.likes.create(user: current_user)
    # end
      redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find(params[:id]).destroy

    redirect_back(fallback_location: root_path)
  end
end
