class UsersController < ApplicationController
  def profile
  	@user = current_user
  end
  def update
  	if current_user.update_attributes(user_params(params))
  		flash[:success] = "Profile successfully updated!"
  	else
  		flash[:error] = current_user.errors.full_messages.join(", ")
  	end
  	redirect_to "/user/profile"
  end

  private
  def user_params params
  	params.require(:user).permit(:first_name, :last_name, :avatar, :address)
  end
end
