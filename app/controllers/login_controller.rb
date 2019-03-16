class LoginController < ApplicationController

  def index
    render 'index'
  end

  def redirect_to_root
    redirect_to :root
  end

  def authenticate
    user = User.find_by(email: params[:email])
    render json: user
  end

end
