# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::Base
  around_action :set_locale

  def set_locale(&action)
    locale = params[:locale] || locale_from_header || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def locale_from_header
    request.env.fetch("HTTP_ACCEPT_LANGUAGE", "").scan(/[a-z]{2}/).first
  end

  private

  def authenticate_user!
    redirect_to(root_path, alert: "You must be logged in!") unless user_signed_in?
  end

  def current_user
    Current.user ||= authenticate_user_from_session
  end
  helper_method :current_user

  def authenticate_user_from_session
    User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in?

  def login(user)
    Current.user = user
    reset_session
    session[:user_id] = user.id
  end

  def logout(_user)
    Current.user = nil
    reset_session
  end
end
