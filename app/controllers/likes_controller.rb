class LikesController < ApplicationController
  before_action :find_micropost
  before_action :find_like, only: [:destroy]

  def create
    # @micropost.like.create = ( user_id: current_user.id)
    #   redirect_to post_path(@micropost)
    if already_liked?
      flash[:notice] = "You can't create more likes"
    else
      @micropost.like.create = (user_id: current_user.id)
    end
    redirect_to micropost_path(@micropost)
  end

  def destroy
    if !already_liked?
      flash[:notice] = "Can't dislike"
    else
      like.destroy
    end
    redirect_to micropost_path(@micropost)
  end

  private
  def already_liked?
    Like.where( user_id: current_user.id, micropost_id: params[:micropost_id]).exists?
  end

  def find_micropost
    @micropost = Micropost.find(params[:micropost_id])
  end

  def find_like
    @like = @micropost.find(params[:id])
  end

end
