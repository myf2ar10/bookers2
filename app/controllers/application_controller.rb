class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user
    flash[:notice] = "Signed in successfully."
    user_path(current_user.id)

#     else
#     flash[:notice] = "error"
# # 何かいる？
#     render :new
    end
  end


  def after_sign_out_path_for(resource)
    root_path

  end


  protected

  def configure_permitted_parameters


    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

# before_action :configure_permitted_parameters, if: :devise_controller?

  # protected

  # def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  # end

end
