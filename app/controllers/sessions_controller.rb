class SessionsController < ApplicationController
  
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      redirect_to '/login'
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    if logged_in? && @user
      puts "in the block"
      session[:user_id] = nil
      redirect_to '/welcome'
    end
  end

  def login
  end

  def welcome
  end

  def page_requires_login
  end
end