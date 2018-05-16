class HomeController < ApplicationController
before_action :authenticate_user!

  def index
    wallet_response = BlockIo.get_address_by :label => current_user.wallet
    wallet = JSON.parse(wallet_response.to_json)
    @network = wallet["data"]["network"]
    @address = wallet["data"]["address"]
    @balance = wallet["data"]["available_balance"].to_d
    price_response = BlockIo.get_current_price :price_base => 'USD'
    price = JSON.parse(price_response.to_json)
    @price = price["data"]["prices"][0]["price"].to_d
  end

end
