class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def create_user_from_facebook
  	user = User.find_or_create_by(:uid => auth['uid']) do |u|
      # u.name = auth['info']['name']
      u.email = auth['info']['email']
    end
    session[:user_id] = user.id
  end

  def auth
    request.env['omniauth.auth']
  end

  # def current_user
    
  # end
end
