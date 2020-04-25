class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @default_address = @user.addresses.find_by(is_default: true)
  end

  # def edit
  #   @user = User.find(params[:id])
  # end

  def update
    # admin側からエンドユーザー編集をしないことにしたので、このアクションではアカウント停止解除処理を行うことになった。
    # アカウント停止解除処理用のアクションにふさわしい名前にする（あとで）
    @user = User.find(params[:id])
    @user.update(is_deleted: false)
    redirect_to admin_user_path(@user)
  end

  def destroy
    user = User.find(params[:id])
    user.update(is_deleted: true)
    redirect_to admin_user_delete_complete_path
  end

  def destroy_complete
    # アカウント停止されたユーザーのメアドにアカウント停止の旨を送るメールフォーム
  end

end
