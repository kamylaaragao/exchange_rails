class HomeController < ApplicationController
  def index
    if params[:currency]
      @transactions = Transaction.where(nil)
      filtering_params(params).each do |key, value|
        @transactions = @transactions.public_send(key, value) if value.present?
      end
    else
      @transactions = Transaction.where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day)
    end
  end

  private

  def filtering_params(params)
    params.slice(:currency)
  end
end
