class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_gettext_locale
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, flash: { error: _("You are not authorized to perform this action.")}
  end
end
