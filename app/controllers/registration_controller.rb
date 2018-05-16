require 'json'

class RegistrationController < Devise::RegistrationsController

  def create
    super

    if resource.save
      response = BlockIo.get_new_address.to_json
      json = JSON.parse(response)
      resource.wallet = json["data"]["label"]
      resource.btc_address = json["data"]["address"]
      resource.save
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

end
