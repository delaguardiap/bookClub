class UserSessionsController < ApplicationController
	skip_before_action :require_login, except: [:destroy]
  def new
  	@user = User.new
  end

  def create
  	if @user = login(params[:email], params[:password])
  		redirect_back_or_to(:users, notice: 'Login successful')
  	else
  		flash[:alert] = 'Login failed'
  		redirect_to login_path
  	end
  end

  def destroy
  	logout
  	redirect_to(login_path, alert: 'Logged out')
  end
end
