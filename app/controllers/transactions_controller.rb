class TransactionsController < ApplicationController
  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
     @transaction = Transaction.new
     @users = User.all
  end

  def create
    @users = User.all
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to root_path
    else
      flash[:alert] = 'Você deve informar todos os dados da transação'
      render :new
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])
    @users = User.all
  end

  def update
    @transaction = Transaction.find(params[:id])
    @transaction.update(transaction_params)
    if @transaction.save
      redirect_to @transaction
    else
      @users = User.all
      flash[:alert] = 'Você deve informar todos os dados da transação'
      render :new
    end
  end

  def destroy
    transaction = Transaction.find(params[:id])
    transaction.destroy
    flash[:success] = 'Transação apagada com sucesso!'
    redirect_to root_path
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :currency, :quotation, :transaction_type, :user_id)
  end
end
