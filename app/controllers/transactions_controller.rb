class TransactionsController < ApplicationController
  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
     @transaction = Transaction.new
  end

  def create

    @transaction = Transaction.new(params.require(:transaction).permit(:amount, :currency, :quotation, :transaction_type))
    if @transaction.save
      redirect_to root_path
    else
      render :new
    end
  end

end
