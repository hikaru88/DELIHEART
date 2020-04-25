class Admin::NoticesController < ApplicationController

  def new
    user = User.find(params[:user_id])
    @notice_new = user.notices.build
  end

  def create
    user = User.find(params[:user_id])
    @notice_new = user.notices.build(notice_params)
    if @notice_new.save
      redirect_to admin_notices_path(user)
    else
      render :new
    end
  end
  
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @notice = Notice.find(params[:id])
  end

  private
    def notice_params
      params.require(:notice).permit(:title, :text)
    end

end
