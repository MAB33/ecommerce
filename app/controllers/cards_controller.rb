class CardsController < ApplicationController

	before_action :set_card, only: [:show, :edit, :update, :destroy]

  	def show
  		@cards = Card.all
	end

	def new
		# @user = User.find(session[:user_id])
		# @card = Card.new

		# NEW STUFF BELOW
			# puts params.inspect
			# puts "*******#{params[:user_id]}*******"
			# puts "*********#{current_user.id}"
		if current_user
			@user = User.find(session[:user_id])
			@card = Card.new
			render :new
		else
			redirect_to '/'
		end
	end

	def edit
		@user = User.find(session[:user_id])
	end

	def create
		@user = User.find(session[:user_id])
		@card = Card.create(card_params)

	    if @card.errors.empty?
	      flash[:notice] = "Your card has been added!"
	      redirect_to @card.user
	    else 
	      flash[:alert] = "There was a problem adding the credit card. Please try again."
	      render :new
	      # @user = User.find(session[:user_id])
	      # render 'users/edit'
	    end
	end

	def update
		@user = User.find(session[:user_id])
	    if @user.id == params[:user_id]
	      if @card.update(card_params)
	        flash[:notice] = "Credit Card info updated."
	        redirect_to @card.user
	      else
	        flash[:alert] = "There was a problem updating your credit card information. Please try again."
	        render :edit
	      end
	    else
	      flash[:alert] = "Hey, this isn't you! You can't update this!"
	      render :edit
	    end
  end

  def destroy
  	@user = User.find(session[:user_id])
    if @user.id == session[:user_id]
      if @card.delete
        flash[:notice] = "Credit card has been deleted."
        redirect_to @card.user
      else
        flash[:alert] = "There was a problem deleting your account."
        redirect_to @card.user
      end
    else
      flash[:alert] = "Hey, this isn't you! You can't delete this!"
      redirect_to @user
    end
  end

  	def current_user
		session[:user_id].nil? ? nil :User.find(session[:user_id])
	end

  private
	def card_params
		params.require(:card).permit(:card_type, :fname, :lname, :user_id, :card_number)
	end

	def set_card
		@card = Card.find(params[:id])
	end

end
