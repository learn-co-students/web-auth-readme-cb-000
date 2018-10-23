class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user

  private

  ENV['FOURSQUARE_CLIENT_ID'] = 'SWS5QECKMFVXFCFUVG3MDXIWFHMM4NR1MAQE1TZE3QYJRVIU'
  ENV['FOURSQUARE_SECRET'] = 'JLLQI0H1KAIJJ342ZUAVZLGFKHAALXIXZRW41PWB3WS1CV5M'

  def authenticate_user
    client_id = ENV['FOURSQUARE_CLIENT_ID']
    redirect_uri = CGI.escape("http://localhost:3000/auth")
    foursquare_url = "https://foursquare.com/oauth2/authenticate?client_id=#{client_id}&response_type=code&redirect_uri=#{redirect_uri}"
    redirect_to foursquare_url unless logged_in?
  end

  def logged_in?
    !!session[:token]
  end
end
