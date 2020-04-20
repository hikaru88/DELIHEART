class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_surprises_path
    when User
      surprises_path
    end
  end
end
