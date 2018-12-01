class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_article!

  def index
    @comments = @micropost.comments.order(created_at: :desc)
  end

  def create
    @comment = @micropost.comments.new(comment_params)
    @comment.user = current_user

    render json: { errors: @comment.errors }, status: :unprocessable_entity unless @comment.save
 end

  def destroy
    @comment = @micropost.comment.find(params[:id])

    if @comment.user_id == @current_user_id
      @comment.destroy
      render json: {}
  end
else
  render json: { errors: { comment: ['not owned by user'] } },status: :forbidden
    end

  private

  def find_article!
    @microposts = Microposts.find_by_slug!(params[:microposts_slug])
  end

  def comment_params
    params.require(:comment).permit(:body)
end
