class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

   # ログイン後の遷移先の指定
  def after_sign_in_path_for(resource)
    case resource
    when Trainer
      trainer_trainer_path(resource)
    when User
      customers_my_page_path
    end
  end

  # ログアウト後の遷移先の指定
  def after_sign_out_path_for(resource)
    if resource == :trainer
      new_trainer_session_path
    else
      root_path
    end
  end

   protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana])
  end

end
