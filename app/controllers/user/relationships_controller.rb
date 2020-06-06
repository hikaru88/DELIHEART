class User::RelationshipsController < ApplicationController
  def follow
    Relationship.create(active_id: current_user.id,
                        passive_id: params[:user_id].to_i,
                        status: 0
                        )
    redirect_back(fallback_location: root_path)
  end

  def unfollow
    relationship = Relationship.find_by(active_id: current_user.id,
                                        passive_id: params[:user_id].to_i,
                                        status: 0
                                        )
    relationship.destroy
    redirect_back(fallback_location: root_path)
  end

  def block
    if relation = Relationship.find_by(active_id: current_user.id,
                                       passive_id: params[:user_id].to_i,
                                       status: 0
                                       )
      relation.update(status: 1)

      # 相手からフォローされていた場合、相手からのフォローを解除する。
      if passive_relation = Relationship.find_by(active_id: params[:user_id].to_i,
                                                 passive_id: current_user.id,
                                                 status: 0
                                                 )
        passive_relation.destroy
      end
      redirect_back(fallback_location: root_path)
    else
      Relationship.create(active_id: current_user.id,
                          passive_id: params[:user_id].to_i,
                          status: 1
                          )

      # 相手からフォローされていた場合、相手からのフォローを解除する。
      if passive_relation = Relationship.find_by(active_id: params[:user_id].to_i,
                                                 passive_id: current_user.id,
                                                 status: 0
                                                 )
        passive_relation.destroy
      end
      redirect_back(fallback_location: root_path)
    end
  end

  def unblock
    relation = Relationship.find_by(active_id: current_user.id,
                                    passive_id: params[:user_id].to_i,
                                    status: 1
                                    )
    relation.destroy
    redirect_back(fallback_location: root_path)
  end
end
