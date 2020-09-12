class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      log_in(@user)
      render 'create', formats: 'json', handlers: 'jbuilder'
    else
      render json: { errors: [{ message: "ログインに失敗しました。\nユーザー名かパスワードが間違っています。" }] }
    end
  end
end
