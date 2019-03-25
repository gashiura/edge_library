class LoginController < ApplicationController
  protect_from_forgery except: authenticate

  def index
    render 'index'
  end

  def authenticate
    @user = User.find_by(email: params[:email])
    @result = user && user.password === params['password']
    if @result
      render 'authenticate', formats: 'json', handlers: 'jbuilder'
    else
      render json: {}
  end

end
