class ApplicationController < ActionController::Base
  require 'block_io'
  BlockIo.set_options :api_key=> '1693-8256-de91-6587', :pin => 'Vfcfyz123', :version => 2

end
