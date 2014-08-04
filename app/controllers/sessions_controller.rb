class SessionsController < ApplicationController
  
  def create
  	#check username for existing user
  	@user = User.find_by(username: params[:username])
  	#if user exists check pwd matches
  	if @user
  		if @user.password == params[:password]
  		#if match set session id
  		session[:user_id] = @user.id
  		flash[:notice] = "You have been signed in."
  		redirect_to @user
  		#if no match flash then reroute to login
  		else
  			flash[:alert] = "Password does not match. Please try again."
  			redirect_to login_path
  		end
  	else
  		flash[:alert] = "Username does not exist."
  		redirect_to login_path
  	end
  end

  def destroy
  	session[:user_id] = nil
    session[:order_id] = nil
  	flash[:notice] = "You have been logged out"
  	redirect_to root_path
  end

end
