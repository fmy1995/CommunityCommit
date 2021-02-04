class ApplicationController < ActionController::Base
 protect_from_forgery with: :exception

 def after_sign_in_path_for(resource)
    # customers_products_path
    case resource
    when Admin
      admins_communities_path
    when User
      users_communities_path
    end
 end

  before_action :configure_permitted_parameters, if: :devise_controller?

   protected

     def configure_permitted_parameters
       #以下の:name部分は追加したカラム名に変える
       devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:postal,:adress,:phone_number])
     end

end
