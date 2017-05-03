class SessionsController < ApplicationController

  skip_before_action :authenticate_user, only: :create

  def create
    resp = Faraday.get("https://foursquare.com/oauth2/access_token") do |r|
      r.params['client_id'] = ENV['FOURSQUARE_CLIENT_ID']
      r.params['client_secret'] = ENV['FOURSQUARE_SECRET']
      r.params['grant_type'] = 'authorization_code'
      r.params['redirect_uri'] = "http://138.197.214.116:30000/auth"
      r.params['code'] = params[:code]
    end

    body = JSON.parse(resp.body)
    session[:token] = body["access_token"]
    redirect_to root_path
  end

end
