class HomeController < ApplicationController
before_action :authenticate_user!

  def index
    response = BlockIo.get_address_by :label => current_user.wallet
    @wallet = JSON.parse(response.to_json)
    @network = @wallet["data"]["network"]
    @address = @wallet["data"]["address"]
    @balance = @wallet["data"]["available_balance"]
  end

end
