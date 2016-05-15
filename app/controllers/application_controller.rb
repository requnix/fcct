class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  alias current_user current_member

  # Static Pages
  def home
    render 'static/home'
  end

  def sponsors

  end

protected

  def access_denied(exception)
    redirect_to home_path, alert: exception.message
  end

  def authenticate_committee!
    raise CanCan::AccessDenied unless current_member.committee?
  end

  def markdown
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end
  helper_method :markdown
end
