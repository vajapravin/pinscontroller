class AuthenticationsController < ApplicationController

  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    omniauth = request.env["omniauth.auth"]
    print "=================omniauth=#{omniauth.to_json}===================="
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    
    if authentication
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, authentication.user)
    elsif current_user
      current_user.apply_omniauth(omniauth)
      flash[:notice] = "Authentication successful."
      redirect_to authentications_url
      # redirect_to user_session_path
    else
      user = User.new(params[:user])
      user.apply_omniauth(omniauth)
      user.is_admin = false
      session[:omniauth] = omniauth
      flash[:error] = "#{user.errors.full_messages.join(', ')}!"
      print "===============#{user.errors.full_messages}==============="
      redirect_to new_user_registration_url
    end
  end
  
  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end

end