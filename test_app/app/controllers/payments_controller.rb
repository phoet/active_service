class PaymentsController < ApplicationController
  
  service :payment
  
  def index
    render :text => "blaaaaaaa #{ActiveService::VERSION} --> #{service(:payment).testo}"
  end
  
end
