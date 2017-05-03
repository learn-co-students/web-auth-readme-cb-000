class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user

  private

  def authenticate_user
    client_id = ENV['FOURSQUARE_CLIENT_ID']
    #need to change to url and authorize that url in your app settings
    redirect_uri = CGI.escape('http://138.197.214.116:30000/auth')
    foursquare_url = "https://foursquare.com/oauth2/authenticate?client_id=#{client_id}&response_type=code&redirect_uri=#{redirect_uri}"

    redirect_to foursquare_url unless logged_in?
  end

  def logged_in?
    !!session[:token]
  end

end
