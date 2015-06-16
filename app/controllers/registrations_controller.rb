class RegistrationsController < Devise::RegistrationsController

  protected
    def update_resource(resource, params)
      resource.update_without_password(params)
    end

  private
    def sign_up_params
      if params[:user]
        params.require(:user).permit(:username, :email, :password,
                                     :password_confirmation)
      end
    end

    def account_update_params
      if params[:user]
        params.require(:user).permit(:username, :email, :password,
                                     :password_confirmation)
      end
    end
end