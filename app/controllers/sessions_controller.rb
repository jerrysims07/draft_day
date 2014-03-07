# class SessionsController < ApplicationController

#   before_action :authenticate_user!

#   def new
#   end

#   def create
#     # user = User.find_by(email: params[:session][:email].downcase)
#     user = User.find_by(email: params[:email].downcase)
#     if user
#       sign_in user
#       redirect_to user
#     else
#       flash.now[:error] = 'invalid email/password combination'
#       render 'new'
#     end
#   end

#   def destroy
#   end

# end
