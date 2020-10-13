class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{user_params['username']}, you are now registered and logged in!"
      redirect_to '/dashboard'
    else
      flash[:errors] = @user.errors.full_messages.to_sentence
      @user.email = '' if @user.errors.details.keys.include?(:email)
      redirect_to '/registration'
    end
  end

  def show
    @user = User.find(current_user.id)
  end

  def add_friend
    friend = User.where(email: params[:friend])
    if friend.empty?
      flash[:error] = 'Could not find a user with that email'
    else
      @friendship = Friendship.create(followed_id: friend.first.id, follower_id: current_user.id)
      flash[:success] = "#{params[:friend]} has been added to your friends!"
    end
    redirect_to '/dashboard'
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
