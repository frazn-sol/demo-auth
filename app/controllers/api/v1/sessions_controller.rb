class Api::V1::SessionsController < Devise::SessionsController
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  respond_to :json

  def create
    @user = warden.authenticate(:scope => resource_name, :recall => "#{controller_path}#failure")
    if @user.present?  
      render :status => 200,
           :json => { :success => true,
                      :info => "Logged in",
                      :data => { :auth_token => current_user.authentication_token, 
                                 :user_info => current_user,
                                 :profile_picture => current_user.profile_picture,
                                 :cover_photo => current_user.cover_photo }}
    else
      render :status => 300,
      :json => { :success => false, :info => "Invalid email or password"}
    end
  end

  def destroy
      current_user = User.find_by_authentication_token(params[:auth_token])
      if current_user.present?
        current_user.update_column(:authentication_token, nil)
        render :status => 200,
             :json => { :success => true,
                        :info => "Logged out",
                        :data => {} }
      else
        render :status => 401,
           :json => { :success => false,
                      :info => "You need to sign in or signup before continuing",
                      :data => {} }
      end
  end

  def failure
    render :status => 401,
           :json => { :success => false,
                      :info => "Login Failed",
                      :data => {} }
  end
end