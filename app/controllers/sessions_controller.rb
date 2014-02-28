class SessionsController < ApplicationController

  def new
    # @session = Session.new
  end

  def create
    render 'new'
  end

  def destroy
  end

end
