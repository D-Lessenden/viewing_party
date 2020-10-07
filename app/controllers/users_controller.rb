class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(current_user.id)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{user_params["email"]}, you are now registered and logged in!"
      redirect_to "/dashboard"
    else
      flash[:errors] = @user.errors.full_messages.to_sentence
      if @user.errors.details.keys.include?(:email)
        @user.email = ""
      end
      redirect_to "/registration"
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
