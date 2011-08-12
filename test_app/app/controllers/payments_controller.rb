class PaymentsController < ApplicationController
  
  def index
    render :text => "blaaaaaaa #{ActiveService::VERSION} --> #{service(:payment).testo}"
  end
  
end
