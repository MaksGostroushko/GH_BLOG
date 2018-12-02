class ApplicationController < ActionController::Base
  protect_from_forgery prepend:true
  include SessionsHelper

  private

    # Confirm whether the user login
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
