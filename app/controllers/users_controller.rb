class UsersController < ApplicationController 
  protect_from_forgery
  
  def new
    @user = User.new
    render template: "users/new"
  end

  def login
    if current_user
      redirect_to "/users/#{current_user.id}"
    else
      render template: "users/login"
    end
  end

  def new_session
    @user = User.find_by(email: user_params[:email])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to "/users/#{current_user.id}"
    else
    end
  end

  def create
    if !current_user
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to "/users/#{current_user.id}"
      else
        render template: 'users/new'
      end
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to "/"
  end

  def show
    if current_user.id.to_s == params[:id]
      render template: 'users/show'
    else
      redirect_to login_page_path 
    end
  end


  private
  def current_user
    if session[:user_id] == nil
      nil
    else
      User.find(session[:user_id])
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :username)
  end
end
