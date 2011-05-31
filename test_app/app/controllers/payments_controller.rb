class PaymentsController < ApplicationController
  
  def index
    render :text => "blaaaaaaa #{ActiveService::VERSION}"
  end
  
end
