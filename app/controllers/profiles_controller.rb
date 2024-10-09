class ProfilesController < ApplicationController


  def show
    @profile = current_user
  end

  def edit
    @profile = current_user
  end

  def update
    @profile = current_user
    if @profile.update(profile_params)
      redirect_to profile_path, notice: 'プロフィールが更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_profile
    @profile = current_user
    redirect_to root_path, alert: "アクセス権限がありません。" unless @profile.id == params[:id].to_i
  end
end
