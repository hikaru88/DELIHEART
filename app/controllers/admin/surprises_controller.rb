class Admin::SurprisesController < ApplicationController

  def index
    @surprises = Surprise.all
  end

  def show
    @surprise = Surprise.find(params[:id])
  end

  def new
    # いったん保留
    # admin側からサプライズ投稿する必要があるか？
    # もしサプライズ投稿できるようにする場合、Surprise.user_idはどうするか？
  end

  def edit
    @surprise = Surprise.find(params[:id])
  end

  def update
    @surprise = Surprise.find(params[:id])
    # 出品一時停止ボタンが押されたか判定
    if params[:flag] == "true"
      @surprise.update(is_active: false)
      redirect_to admin_surprise_path(@surprise)
    elsif params[:flag] == "false"
      @surprise.update(is_active: true)
      redirect_to admin_surprise_path(@surprise)
    else
      @surprise.update(surprise_params)
      redirect_to admin_surprise_path(@surprise)
    end
  end

  def destroy
    @surprise = Surprise.find(params[:id])
    @surprise.destroy
    redirect_to admin_surprise_delete_complete_path
  end

  def destroy_complete
    # 削除されたサプライズの出品ユーザーにメッセージを送るフォームを表示するページ
  end

  private
    def surprise_params
      params.require(:surprise).permit(:name, :description, :price, :year, :month, :day, :main_image, target_areas_attributes: [:id, :name])
    end
end
