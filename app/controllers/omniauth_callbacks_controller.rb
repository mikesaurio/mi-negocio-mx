class OmniauthCallbacksController < Devise::OmniauthCallbacksController   

def facebook     
     @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)      
     if @user.persisted?       
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to root_path
    end
  end

  def linkedin
    puts '******************link'
    auth = env["omniauth.auth"]
       puts '******************link'
    @user = User.connect_to_linkedin(request.env["omniauth.auth"],current_user)
       puts '******************link'
    if @user.persisted?
         puts '******************if'
    #  flash[:notice] = I18n.t "devise.omniauth_callbacks.success"
    redirect_to root_path#  sign_in_and_redirect @user, :event => :authentication
    else
         puts '******************else'
      session["devise.linkedin_uid"] = request.env["omniauth.auth"]
      redirect_to root_path
    end
  end
end