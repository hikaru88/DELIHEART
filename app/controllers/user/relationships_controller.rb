class User::RelationshipsController < ApplicationController
  def create
    Relationship.create(follower_id: current_user.id,
                        followed_id: params[:user_id].to_i
                        )
    redirect_back(fallback_location: root_path)
  end

  def destroy
    relationship = Relationship.find_by(follower_id: current_user.id,
                                        followed_id: params[:user_id].to_i
                                        )
    relationship.destroy
    redirect_back(fallback_location: root_path)
  end
end
