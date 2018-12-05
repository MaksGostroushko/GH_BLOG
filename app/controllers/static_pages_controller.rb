class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.microposts.views.paginate(page: params[:page], :per_page => 4)
    end
    #   case params[:sorting]
    #   when "views_desc"
    #     @feed_items = @feed_items.views_desc
    #   end
    #   @feed_items = @feed_items.paginate(page: params[:page])
  end

end
