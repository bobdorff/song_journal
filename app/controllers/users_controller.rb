class UsersController < ApplicationController 
  protect_from_forgery
  
  def new
    @user = User.new
    render template: "users/new"
  end

  def login
    if current_user
      redirect_to '/'
    else
      render template: "users/login"
    end
  end

  def new_session
    @user = User.find_by(email: user_params[:email])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      render template: 'users/new'
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to "/"
  end


  private
  def current_user
    return nil if session[:user_id].nil?
    User.find(session[:user_id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :username)
  end
end
