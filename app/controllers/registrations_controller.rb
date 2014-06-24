class RegistrationsController < Devise::RegistrationsController

  def create
  	params[:user][:role] = "user"
  	super
  	session[:omniauth] = nil unless @user.new_record?
  end

  def clean_up_passwords(*args)
    
  end
  
  private 
  
  def build_resource(*args)
    super
    if session[:omniauth]
      @user.apply_omniauth(session[:omniauth])
      @user.valid?
    end
  end

end