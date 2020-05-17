class User::ReviewsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @review = Review.find(params[:id])
    @user = @review.from_user
  end

  def new
    @review_new = Review.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @review_new = Review.new(review_params)
    @review_new.from_user_id = current_user.id
    @review_new.to_user_id = @user.id
    @review_new.save
    redirect_to review_path(@review_new)
  end

  private
    def review_params
      params.require(:review).permit(:title, :text, :image)
    end
end
