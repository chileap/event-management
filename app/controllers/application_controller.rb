class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :set_layout

  def current_controller?(names)
    return false if params[:controller].blank?
    names.include?(params[:controller])
  end

  helper_method :current_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  # Set layout for devise controllers
  def set_layout
    if current_controller?(%w[devise/registrations]) && action_name == "edit"
      "application"
    elsif current_controller?(%w[devise/sessions devise/registrations devise/passwords])
      "devise"
    else
      "application"
    end
  end
end
