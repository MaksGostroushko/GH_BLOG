class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  before_action :set_params, only: [:show, :toggle_banned, :update, :edit, :following, :followers]

  def index
    @users = User.paginate(page: params[:page], per_page: 7)
    @microposts = Micropost.all
  end

  def show
    @microposts = @user.microposts.published.desc
    @microposts = @microposts.public_send(params[:sorting]) if params[:sorting].present?
    @microposts = @microposts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to root_path
      flash[:info] = "Welcome to GHBlog"
    else
      render 'new'
    end
  end

  def toggle_banned
    @user.toggle!(:banned)
    redirect_to users_path
     flash[:success] = 'User update'
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def edit
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

  def set_params
    @user  = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  # Confirms the current user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  # Confirms an main user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
