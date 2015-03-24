class UsersController < ApplicationController
  before_filter :set_user

  def edit
    @user = current_user
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to edit_user_path, notice: t('flash.users.updated')
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :address,
      :operation_license,
      :operation_license_file,
      :land_permission_file
    )
  end

  def set_user
    @user ||= current_user
  end
end
