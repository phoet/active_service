class PaymentService < ActiveService::Base
  def testo
    "moin moin\n#{ENV['RACK_ENV']}\n#{params}"
  end
end
