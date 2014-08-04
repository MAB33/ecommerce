require 'rails_helper'

RSpec.describe User, :type => :model do

	let(:user){ FactoryGirl.build(:user)}
	let(:card){ FactoryGirl.build(:card) }

	describe "is invalid without a..." do
		
		it "name" do
			user.username = nil
			expect(user).to be_invalid
		end
		
		context "a password" do
			it "password" do
				user.password = nil
				expect(user).to be_invalid
			end
		end

		#HOW SHOULD THIS BE WRITTEN???????
		context "a valid password confirmation" do
			it "password confirmation" do
				user2 = build(:user, password: "123", password_confirmation: "abc")
				expect(user2).to be_invalid
			end
		end

	end

	describe "activerecord associations" do
	
		it "has many cards" do
			expect{ FactoryGirl.create(:user).cards }.to_not raise_error
		end

		it "destroys cards when user is deleted" do
			user.cards << card
			user.destroy
			expect(Card.all).to_not include(:card)
		end

	end


end