class Admin::ReviewsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to review_delete_complete_path
  end

  def destroy_complete
  end

end
