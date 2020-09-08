class LoginController < ApplicationController
  protect_from_forgery except: :authenticate

  def index
    render 'index'
  end

  def authenticate
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      render 'authenticate', formats: 'json', handlers: 'jbuilder'
    else
      render json: { errors: [{ message: "ログインに失敗しました。\nユーザー名かパスワードが間違っています。" }] }
    end
  end
end
