class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.microposts.desc.paginate(page: params[:page], per_page: 4)
    end
  end

  def moon;end

  def coffee;end

  def according;end
end
