class User::SurpriseFavoritesController < ApplicationController
  def index
  end

  def create
    favorite = current_user.surprise_favorites.new(surprise_id: params[:surprise_id])
    favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    favorite = current_user.surprise_favorites.find_by(surprise_id: params[:surprise_id])
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end

end
