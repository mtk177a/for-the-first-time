class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [ :new, :create ]

  def new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_to root_path, notice: "ログインに成功しました。"
    else
      flash.now[:alert] = "ログインに失敗しました。"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to login_path, notice: "ログアウトしました。"
  end
end
