class Api::V1::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json

  def create
    build_resource(params[:user])
    if resource.save
      sign_in resource
      render :status => 200,
           :json => { :success => true,
                      :info => "Registered",
                      :data => { :auth_token => current_user.authentication_token, 
                                 :user_info => current_user }}
    else
      render :status => :unprocessable_entity,
             :json => { :success => false,
                        :info => resource.errors.full_messages }
    end
  end
end