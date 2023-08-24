class ApplicationController < ActionController::Base


 before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if about_path
    flash[:notice] = "Signed in successfully."
    redirect_to user_path(@user.id)

    else
    flash[:notice] = "error"
# 何かいる？
    render :new
    end
  end


  def after_sign_out_path_for(resource)
    about_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end


# before_action :configure_permitted_parameters, if: :devise_controller?

  # protected

  # def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  # end
end
