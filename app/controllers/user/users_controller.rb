class User::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @default_address = @user.addresses.find_by(is_default: true)
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    current_user.update(is_deleted: true)
    session.clear
    redirect_to user_delete_complete_path
  end

  def destroy_confirm
    # 退会確認画面
  end

  def destroy_complete
    # 退会完了画面
  end

  private
    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end
end
