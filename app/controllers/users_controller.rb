class UsersController < ApplicationController
  def new
     @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      flash[:alert] = 'Você deve informar todos os dados'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :cpf)
  end
end
