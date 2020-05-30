class User::SurprisesController < ApplicationController
  def index
    @surprises = Surprise.where.not(is_active: false)
  end

  def show
    @surprise = Surprise.find(params[:id])
    # サプライズ詳細画面を開くたびにview側でif文を動かしたくない。
    # あとで「お探しの商品は見つかりません」ページを作る。
    # if @surprise.is_active == false
    #   @text = "お探しの商品は見つかりません。"
    # end
  end

  def new
    @surprise_new = Surprise.new
    # buildがあれば、最初からフォームが表示される（cocoon）
    @surprise_new.target_areas.build
  end

  def create
    @surprise_new = Surprise.new(surprise_params)
    @surprise_new.user_id = current_user.id
    if @surprise_new.save
      redirect_to surprise_path(@surprise_new)
    else
      render :new
    end
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
      redirect_to surprise_path(@surprise)
    end
  end

  def destroy
    surprise = Surprise.find(params[:id])
    surprise.destroy
    redirect_to surprise_delete_complete_path
  end

  def destroy_complete
    # 削除完了ページ
  end

  private
    def surprise_params
      params.require(:surprise).permit(:name, :description, :price, :main_image, :postage, target_areas_attributes: [:id, :name], surprise_images_attributes: [:id, :image])
    end
  
end
