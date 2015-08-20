class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    if params[:session][:username] == "admin" && params[:session][:password] == "secret"
      log_in
      redirect_to root_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  	log_out
    redirect_to root_url
  end
end
