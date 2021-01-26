class ApplicationController < ActionController::Base
    
 def after_sign_in_path_for(resource)
    # customers_products_path
    case resource
    when Admin
      admins_communities_path
    when User
      users_communities_path
    end
 end


end
