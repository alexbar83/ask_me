class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to root_path, notice: 'Вы зарегистрировались'
    else
      flash.now[:alert] = 'Вы неправильно заполнили поля формы регистрации'
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(params_user)
      redirect_to root_path, notice: 'Данные пользователя обновлены'
    else
      flash.now[:alert] = 'При попытке сохранить пользователя возникли ошибки'
      render :edit
    end
  end

  def destroy
    @user.destroy

    session.delete(:user_id)

    redirect_to root_path, notice: 'Пользователь удален'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def params_user
    params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation)
  end
end
