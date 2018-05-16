class ApplicationController < ActionController::Base
  require 'block_io'
  BlockIo.set_options :api_key=> ENV['BTC_KEY'], :pin => ENV['PIN'], :version => 2

end
