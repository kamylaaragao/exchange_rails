class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
     @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      flash[:alert] = 'Você deve informar todos os dados do usuário'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to @user
    else
      flash[:alert] = 'Você deve informar todos os dados do usuário'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :cpf)
  end
end
