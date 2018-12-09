class LikesController < ApplicationController
  def create
    @micropost = Micropost.find(params[:micropost_id])

    @like = @micropost.likes.create(user: current_user)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy

    redirect_back(fallback_location: root_path)
  end
end
