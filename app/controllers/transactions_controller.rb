class TransactionsController < ApplicationController
  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
     @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def update
    @transaction = Transaction.find(params[:id])
    @transaction.update(transaction_params)
    if @transaction.save
      redirect_to @transaction
    else
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :currency, :quotation, :transaction_type)
  end
end
