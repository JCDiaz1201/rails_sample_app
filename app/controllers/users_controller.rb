class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    # debugger # this debugger is so cool! Pauses the program and opens up a rails console allowing you to insepect the state of the program
  end

  def create
    @user = User.new(user_params)

    if @user.save
      reset_session
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private 
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end

