class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  before_action :set_params,     only: [:show, :edit, :update]

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
    # @micropost = Micropost.find(params[:id])
    @comments = @micropost.comments

    @micropost.increment!(:views_count)
  end

  def edit
    # @micropost = Micropost.find(params[:id])
  end

  def update
    # @micropost = Micropost.find(params[:id])

    if @micropost.update!(micropost_params)
      redirect_to @micropost
      flash[:success] =  'Post was successfully updated'
    else
      render 'edit'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
    # referrer - get request referer path?
  end

  private

    def set_params
      @micropost = Micropost.find(params[:id])
    end

    def micropost_params
      params.require(:micropost).permit(:title, :content, :picture, :link)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end

    def post_params
      params.require(:micropost).permit(:body, :image)
    end
end
