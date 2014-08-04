class UsersController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update, :destroy]
	before_action :current_user, excpet: [:new, :create]

	def index
		if current_user
			redirect_to user_path(current_user)
		else
			redirect_to '/'
		end
	end

	def show
		if current_user
			if @user.id == current_user.id
				# @card = Card.new
				@cards = Card.all
				render :show
			else 
				redirect_to user_path(current_user)
			end
		else
			redirect_to '/'
		end
	end

	def new
		@user = User.new
		# @card = Card.new
	end

	def edit
		if current_user
			if @user.id == current_user.id
				render :edit
			else 
				redirect_to edit_user_path(current_user)
			end
		else
			redirect_to '/'
		end
	end

	def create
		@user = User.create(user_params)
	    if @user.errors.empty?
	      flash[:notice] = "Your account has been created!"
	      session[:user_id] = @user.id
	      redirect_to @user
	    else 
	      flash[:alert] = "There was a problem creating your account. Please try again."
	      render :new
	    end
	end

	def update
    if @user.id == session[:user_id]
      if @user.update(user_params)
        flash[:notice] = "User info updated."
        redirect_to @user
      else
        flash[:alert] = "There was a problem updating your profile. Please try again."
        render 'users/edit'
      end
    else
      flash[:alert] = "Hey, this isn't you! You can't update this!"
      redirect_to @user
    end
  end

  def destroy
    if @user.id == session[:user_id]
      if @user.delete
        session[:user_id] = nil
        flash[:notice] = "User has been deleted."
        redirect_to root_path
      else
        flash[:alert] = "There was a problem deleting your account."
        redirect_to @user
      end
    else
      flash[:alert] = "Hey, this isn't you! You can't delete this!"
      redirect_to @user
    end
  end




	private
	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation)
	end

	def set_user
		@user = User.find(params[:id])
	end

	def current_user
		session[:user_id].nil? ? nil :User.find(session[:user_id])
	end

end
