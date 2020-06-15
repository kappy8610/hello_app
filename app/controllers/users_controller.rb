class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @action = "新規登録"
  end

  def show
    @user = User.find(params[:id])
  end
  
  def create
    user_form("new")
  end
  
  def edit
    @user = User.find(params[:id])
    @action = "編集"
  end

  def update
    user_form("edit")
  end

  def user_form(foo)
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      flash[:alert] = "エラーが発生しました。#{@user.errors.full_messages}"
      render foo
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end

end
