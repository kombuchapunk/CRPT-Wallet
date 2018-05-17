class HomeController < ApplicationController
before_action :authenticate_user!

  def index
    wallet_response = BlockIo.get_address_by :label => current_user.wallet
    wallet = JSON.parse(wallet_response.to_json)
    @network = wallet["data"]["network"]
    @address = current_user.btc_address
    @balance = wallet["data"]["available_balance"].to_d

    # price_response = BlockIo.get_current_price :price_base => 'USD'
    # price = JSON.parse(price_response.to_json)
    # @price = price["data"]["prices"][0]["price"].to_d

    sent_response = BlockIo.get_transactions :type => 'sent', :addresses => current_user.btc_address
    sent = JSON.parse(sent_response.to_json)
    @sent = sent["data"]["txs"]

    received_response = BlockIo.get_transactions :type => 'received', :addresses => current_user.btc_address
    received = JSON.parse(received_response.to_json)
    @received = received["data"]["txs"]

    render :index
  end

  def send_btc_to_address
    BlockIo.withdraw_from_labels :amounts => params[:amount], :from_labels => current_user.wallet, :to_addresses => params[:receiver]
    render :index
  end

  def send_btc_to_user
    BlockIo.get_transactions :type => 'sent', :addresses => current_user.btc_address
    render :index
  end

end
