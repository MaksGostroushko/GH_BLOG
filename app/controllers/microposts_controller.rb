class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  before_action :set_params, only: [:show, :edit, :update, :destroy]

  def index
    @microposts = Micropost.all.order(created_at: :desc)
    @microposts = @microposts.search(params[:search]) if params[:search]
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def show
    @comments = @micropost.comments
    @micropost.increment!(:views_count)
  end

  def edit; end

  def update
    if @micropost.update!(micropost_params)
      flash[:success] = "Post updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  # def repost
  #   orig_post = Micropost.find(params[:id])
  #   if orig_post
  #     Micropost.create(user_id: current_user.id,
  #       content: orig_post.content,
  #       repost_id: orig_post.id)
  #     respond_to do |format|
  #       format.js
  #     end
  #   end
  # end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  private

    def set_params
      @micropost = Micropost.find(params[:id])
    end

    def micropost_params
      params.require(:micropost).permit(:title, :content, :picture, :link, :published, :all_tags)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end

    def post_params
      params.require(:micropost).permit(:body, :image, :all_tags)
    end
end
